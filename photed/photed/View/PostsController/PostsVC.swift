//
//  PostsController.swift
//  photed
//
//  Created by Берлинский Ярослав Владленович on 06.03.2022.
//

import UIKit

class PostsVC: UIViewController {

    var hideStatusBar: Bool = true {
         didSet {
             setNeedsStatusBarAppearanceUpdate()
         }
     }

     override var prefersStatusBarHidden: Bool {
            return hideStatusBar
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        scrollView.backgroundColor = .white
        view.addSubview(scrollView)
        
        let postImage = standartAvatar()
        postImage.layer.cornerRadius = 0
        postImage.image = UIImage(named: "none")
        postImage.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: Double((postImage.image?.size.height)!)*( Double(view.frame.width) / Double((postImage.image?.size.width)!)))
        
        let bottomButton = UIButton(frame: CGRect(x: 20, y: 2000, width: 100, height: 100))
        bottomButton.backgroundColor = .systemBlue
        scrollView.addSubview(postImage)
        scrollView.addSubview(bottomButton)
        
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: bottomButton.frame.maxY)
    }
    
}
