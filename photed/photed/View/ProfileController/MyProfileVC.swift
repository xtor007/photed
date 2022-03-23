//
//  MyProfileVC.swift
//  photed
//
//  Created by Anatoliy Khramchenko on 22.03.2022.
//

import UIKit

class MyProfileVC: ProfileVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        userLoginId = db.loginId
        userLoginLabel.text = db.getLoginById(id: userLoginId!)
        editPhoto()
        loadData()
        postsCollectionView.reloadData()
    }
    
}
