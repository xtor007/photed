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
    
    let cellId = "postCellInProfile"
    
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
            label.text = APIObj.db.getLoginById(id: userLoginIdOp)
        }
        label.frame = CGRect(x: EnvData.paddingLeft + EnvData.backButtonWidth, y: EnvData.paddingUp/2, width: view.frame.width/2, height: EnvData.labelHeight)
        return label
    }()
    
    lazy var noPostsLabel: UILabel = {
        let label = standartLable()
        label.font = UIFont(name: "HelveticaNeue", size: 30)
        label.textColor = .gray
        label.text = "This user hasn'n any picktures"
        label.frame = CGRect(x: EnvData.paddingLeft, y: view.frame.height/2, width: view.frame.width - EnvData.paddingLeft*2, height: EnvData.labelHeight)
        label.isHidden = true
        return label
    }()
    
    lazy var backButton: UIButton = {
        let button = standartBackButton()
        button.frame = CGRect(x: EnvData.paddingLeft, y: EnvData.paddingUp/2, width: EnvData.backButtonWidth, height: EnvData.backButtonHeight)
        button.addTarget(self, action: #selector(backAction(sender:)), for: .touchUpInside)
        return button
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
    
    var postsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        view.backgroundColor = .black
        drawInterface()
    }
    
    func drawInterface() {
        view.addSubview(userLoginLabel)
        view.addSubview(userAvatarImage)
        //тяжко
        async {
            try await editPhoto()
        }
        view.addSubview(statistikPostData)
        view.addSubview(statistikSeesData)
        view.addSubview(statistikLikesData)
        loadData()
        view.addSubview(noPostsLabel)
        postsCollectionView = UICollectionView(frame: CGRect(x: 0, y: userAvatarImage.frame.maxY+EnvData.blockDistance, width: view.frame.width, height: view.frame.height-userAvatarImage.frame.maxY-EnvData.blockDistance), collectionViewLayout: UICollectionViewFlowLayout.init())
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        postsCollectionView.setCollectionViewLayout(layout, animated: true)
        postsCollectionView.register(UINib(nibName: "PostInProfileCell", bundle: nil), forCellWithReuseIdentifier: cellId)
        postsCollectionView.dataSource = self
        postsCollectionView.delegate = self
        view.addSubview(postsCollectionView)
        view.addSubview(backButton)
        if posts.isEmpty {
            postsCollectionView.isHidden = true
            noPostsLabel.isHidden = false
        } else {
            postsCollectionView.isHidden = false
            noPostsLabel.isHidden = true
        }
    }
    
    func editPhoto() {
        if let userLoginIdOp = userLoginId {
            getImage(withLink: APIObj.db.getAvatarLinkById(id: userLoginIdOp)) { image in
                self.userAvatarImage.image = image
            } onError: { message in
                print(message)
            }
        }
    }
    
//    private func getImage(link: String?) async throws -> UIImage? {
//        if link != nil {
//            let url = URL(string: link!)
//            if let data = try? Data(contentsOf: url!) {
//                return UIImage(data: data)
//            }
//        }
//        return nil
//    }
    
    func loadData() {
        if posts.isEmpty {
            if let login = userLoginId {
                if let userLoginIdOp: String = userLoginId {
                    userLoginLabel.text = APIObj.db.getLoginById(id: userLoginIdOp)
                }
                posts = APIObj.db.getAllPosts(loginId: login)
                if let count = posts.count.reductionInt() {
                    statistikPostData.text! += count
                }
                if let count = APIObj.db.getCountOfSee(loginId: login).reductionInt() {
                    statistikSeesData.text! += count
                }
                if let count = APIObj.db.getCountOfLike(loginId: login).reductionInt() {
                    statistikLikesData.text! += count
                }
            }
        }
    }
    
    @objc private func backAction(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension ProfileVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PostInProfileCell
        cell.image.image = UIImage(named: "none")
        let post = posts[indexPath.row]
        getImage(withLink: post.photoLink) { image in
            cell.image.image = image
        } onError: { message in
            print(message)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/3, height: view.frame.width/3)
    }
    
}
