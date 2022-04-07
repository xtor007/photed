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
        drawInterface()
        deleteBack()
    }
    
    private func deleteBack() {
        backButton.isHidden = true
        userLoginLabel.frame = CGRect(x: EnvData.paddingLeft, y: EnvData.paddingUp/2, width: view.frame.width/2, height: EnvData.labelHeight)
    }
    
}
