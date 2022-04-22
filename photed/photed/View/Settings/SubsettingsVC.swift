//
//  SugsettingsVC.swift
//  photed
//
//  Created by Anatoliy Khramchenko on 22.04.2022.
//

import UIKit

class SubsettingsVC: UIViewController {
    
    var userLoginId: String!
    
    lazy var nameSettingsLabel: UILabel = {
        let label = standartLable()
        label.frame = CGRect(x: EnvData.paddingLeft, y: EnvData.paddingUp, width: view.frame.width-EnvData.paddingLeft*2, height: EnvData.labelHeight)
        return label
    }()
    
    lazy var backButton: UIButton = {
        let button = standartBackButton()
        button.frame = CGRect(x: EnvData.paddingLeft, y: EnvData.paddingUp, width: EnvData.backButtonWidth, height: EnvData.backButtonHeight)
        button.addTarget(self, action: #selector(backAction(sender:)), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        view.backgroundColor = .black
        view.addSubview(nameSettingsLabel)
        view.addSubview(backButton)
    }
    
    @objc func backAction(sender: UIButton) {
        dismiss(animated: true)
        print(nameSettingsLabel.text)
    }

}
