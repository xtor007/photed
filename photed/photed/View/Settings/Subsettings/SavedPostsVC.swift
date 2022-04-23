//
//  SavedPostsVC.swift
//  photed
//
//  Created by Anatoliy Khramchenko on 22.04.2022.
//

import UIKit

class SavedPostsVC: SubsettingsVC {
    
    var posts: [Post] = []
    
    let cellId = "postCellInSaved"
    
    var postsCollectionView: UICollectionView!
    
    lazy var noPostsLabel: UILabel = {
        let label = standartLable()
        label.font = UIFont(name: "HelveticaNeue", size: 30)
        label.textColor = .gray
        label.text = "You haven't any saved picktures"
        label.frame = CGRect(x: EnvData.paddingLeft, y: view.frame.height/2, width: view.frame.width - EnvData.paddingLeft*2, height: EnvData.labelHeight)
        label.isHidden = true
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        nameSettingsLabel.text = "Saved"
        drawInterface()
    }
    
    func drawInterface() {
        view.addSubview(noPostsLabel)
        if let login = userLoginId {
            posts = db.getSavedPosts(loginId: login)
        }
        postsCollectionView = UICollectionView(frame: CGRect(x: 0, y: nameSettingsLabel.frame.maxY+EnvData.blockDistance, width: view.frame.width, height: view.frame.height-nameSettingsLabel.frame.maxY-EnvData.blockDistance), collectionViewLayout: UICollectionViewFlowLayout.init())
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        postsCollectionView.setCollectionViewLayout(layout, animated: true)
        postsCollectionView.register(UINib(nibName: "PostInProfileCell", bundle: nil), forCellWithReuseIdentifier: cellId)
        postsCollectionView.backgroundColor = .clear
        postsCollectionView.dataSource = self
        postsCollectionView.delegate = self
        view.addSubview(postsCollectionView)
        if posts.isEmpty {
            postsCollectionView.isHidden = true
            noPostsLabel.isHidden = false
        } else {
            postsCollectionView.isHidden = false
            noPostsLabel.isHidden = true
        }
    }
    
}

extension SavedPostsVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PostInProfileCell
        cell.image.image = UIImage(named: "none")
        let post = posts[indexPath.row]
        async {
            if let image = try await getImage(link: post.photoLink) {
                cell.image.image = image
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/3, height: view.frame.width/3)
    }
    
}
