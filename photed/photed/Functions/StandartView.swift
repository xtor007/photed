//
//  standartView.swift
//  photed
//
//  Created by Anatoliy Khramchenko on 06.03.2022.
//

import UIKit

extension UIViewController {
    
    func standartLable() -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 40)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .white
        return label
    }
    
    func standartTextField() -> UITextField {
        let textField = UITextField()
        textField.addTarget(self, action: #selector(self.textFieldDidTaped(_:)), for: UIControl.Event.editingChanged)
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.backgroundColor = UIColor.white
        textField.layer.cornerRadius = 10
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = 14
        textField.clearButtonMode = .whileEditing
        textField.clearButtonMode = .unlessEditing
        textField.clearButtonMode = .always
        textField.layer.borderColor = CGColor.init(red: 100, green: 0, blue: 0, alpha: 1)
        return textField
    }
    
    func standartPasswordTextField() -> UITextField {
        let textField = standartTextField()
        textField.isSecureTextEntry = true
        return textField
    }
    
    func standartButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "buttColor")
        button.layer.cornerRadius = 8
        return button
    }
    
    func standartLittleButton() -> UIButton {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        return button
    }
    
    func standartAvatar() -> UIImageView {
        let avatar = UIImageView()
        //avatar.layer.cornerRadius = 100
        avatar.clipsToBounds = true
        avatar.image = UIImage(named: "none")
        return avatar
    }
    
    func standartBackButton() -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.tintColor = .white
        //CONFIGURATION
        return button
    }
    
}
