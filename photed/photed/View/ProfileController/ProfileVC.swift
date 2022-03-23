//
//  ProfileVC.swift
//  photed
//
//  Created by Берлинский Ярослав Владленович on 06.03.2022.
//

import UIKit

class ProfileVC: UIViewController {
    
    var userLoginId: String?
    
    var posts: [Post] = []
    
    var colorStatusBar: Bool = true {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    lazy var userLoginLabel: UILabel = {
        let label = standartLable()
        label.textAlignment = .left
        if let userLoginIdOp: String = userLoginId {
            label.text = db.getLoginById(id: userLoginIdOp)
        }
        label.frame = CGRect(x: EnvData.paddingLeft, y: EnvData.paddingUp/2, width: view.frame.width/2, height: EnvData.labelHeight)
        return label
    }()
    
    lazy var userAvatarImage: UIImageView = {
        let image = standartAvatar()
        image.frame = CGRect(x: EnvData.paddingLeft, y: userLoginLabel.frame.maxY+EnvData.blockDistance, width: view.frame.width/4, height: view.frame.width/4)
        image.layer.cornerRadius = image.frame.width/2
        print(image.layer.cornerRadius)
        return image
    }()
    
    lazy var statistikPostData: UILabel = {
        let label = standartLable()
        label.text = "Posts\n"
        label.font = UIFont(name: "HelveticaNeue", size: 20)
        label.numberOfLines = 2
        label.frame = CGRect(x: userAvatarImage.frame.maxX+EnvData.blockDistance, y: userAvatarImage.frame.minY, width: view.frame.width/6, height: EnvData.labelHeight*2)
        return label
    }()
    
    lazy var statistikSeesData: UILabel = {
        let label = standartLable()
        label.text = "Views\n"
        label.font = UIFont(name: "HelveticaNeue", size: 20)
        label.numberOfLines = 2
        label.frame = CGRect(x: statistikPostData.frame.maxX+EnvData.blockDistance, y: userAvatarImage.frame.minY, width: view.frame.width/6, height: EnvData.labelHeight*2)
        return label
    }()
    
    lazy var statistikLikesData: UILabel = {
        let label = standartLable()
        label.text = "Likes\n"
        label.font = UIFont(name: "HelveticaNeue", size: 20)
        label.numberOfLines = 2
        label.frame = CGRect(x: statistikSeesData.frame.maxX+EnvData.blockDistance, y: userAvatarImage.frame.minY, width: view.frame.width/6, height: EnvData.labelHeight*2)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        view.backgroundColor = .black
        drawInterface()
    }
    
    private func drawInterface() {
        view.addSubview(userLoginLabel)
        view.addSubview(userAvatarImage)
        editPhoto()
        view.addSubview(statistikPostData)
        view.addSubview(statistikSeesData)
        view.addSubview(statistikLikesData)
        loadData()
    }
    
    func editPhoto() {
        async {
            if let userLoginIdOp = userLoginId {
                if let image = try await getImage(link: db.getAvatarLinkById(id: userLoginIdOp)) {
                    userAvatarImage.image = image
                }
            }
        }
    }
    
    private func getImage(link: String?) async throws -> UIImage? {
        if link != nil {
            let url = URL(string: link!)
            if let data = try? Data(contentsOf: url!) {
                return UIImage(data: data)
            }
        }
        return nil
    }
    
    func loadData() {
        if let login = userLoginId {
            posts = db.getAllPosts(loginId: login)
            if let count = posts.count.reductionInt() {
                statistikPostData.text! += count
            }
            if let count = db.getCountOfSee(loginId: login).reductionInt() {
                statistikSeesData.text! += count
            }
            if let count = db.getCountOfLike(loginId: login).reductionInt() {
                statistikLikesData.text! += count
            }
        }
    }
    
}
