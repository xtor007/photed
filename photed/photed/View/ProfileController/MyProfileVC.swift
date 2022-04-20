//
//  MyProfileVC.swift
//  photed
//
//  Created by Anatoliy Khramchenko on 22.03.2022.
//

import UIKit

class MyProfileVC: ProfileVC {
    
    lazy var settingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "gear"), for: .normal)
        button.tintColor = .white
        button.frame = CGRect(x: view.frame.width-EnvData.paddingLeft-EnvData.backButtonWidth, y: EnvData.paddingUp/2, width: EnvData.backButtonWidth, height: EnvData.backButtonHeight)
        button.addTarget(self, action: #selector(goToSettings(sender:)), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        userLoginId = db.loginId
        drawInterface()
        deleteBack()
        view.addSubview(settingButton)
        noPostsLabel.text = "You haven't any picktures"
    }
    
    private func deleteBack() {
        backButton.isHidden = true
        userLoginLabel.frame = CGRect(x: EnvData.paddingLeft, y: EnvData.paddingUp/2, width: view.frame.width/2, height: EnvData.labelHeight)
    }
    
    @objc private func goToSettings(sender: UIButton) {
        print("settings")
        let settingsVC = SettingsVC()
        settingsVC.modalPresentationStyle = .fullScreen
        present(settingsVC, animated: true)
    }
    
}
