//
//  MyProfileVC.swift
//  photed
//
//  Created by Anatoliy Khramchenko on 22.03.2022.
//

import UIKit
import UIDrawer

class MyProfileVC: ProfileVC {
    
    lazy var settingButton: UIButton = {
        let button = UIButton(configuration: .plain())
        button.setImage(UIImage(systemName: "gear"), for: .normal)
        button.tintColor = .white
        button.frame = CGRect(x: view.frame.width-EnvData.paddingLeft-EnvData.backButtonWidth, y: EnvData.paddingUp/2, width: EnvData.backButtonWidth, height: EnvData.backButtonHeight)
        button.addTarget(self, action: #selector(goToSettings(sender:)), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        userLoginId = APIObj.db.loginId
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
        let settingsVC = SettingsVC()
        settingsVC.userLoginId = userLoginId!
        settingsVC.modalPresentationStyle = .custom
        settingsVC.transitioningDelegate = self
        present(settingsVC, animated: true)
    }
    
}

extension MyProfileVC:  UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentationController = DrawerPresentationController(presentedViewController: presented, presenting: presenting, blurEffectStyle: .dark)
        presentationController.topGap = CGFloat(SettingsScreensParametrs.screens.count)*EnvData.tableViewCellHeight
        return presentationController
    }
}
