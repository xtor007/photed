//
//  RegistrationVC.swift
//  photed
//
//  Created by Берлинский Ярослав Владленович on 04.03.2022.
//

import UIKit

enum Field {
    case login
    case password
    case passwordAgain
    case email
    case phone
}

class RegistrationVC: UIViewController {
    
    private var textFields: [Field: UITextField] = [.login : UITextField(), .password : UITextField(), .passwordAgain : UITextField(), .email : UITextField(), .phone : UITextField()]
        
    lazy var registrationLabel: UILabel = {
        let label = UILabel()
        label.text = "REGISTRATION"
        label.font = UIFont(name: "HelveticaNeue", size: 40)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .white
        label.frame = CGRect(x: EnvData.paddingLeft, y: EnvData.paddingUp, width: view.frame.width-EnvData.paddingLeft*2, height: EnvData.labelHeight)
        return label
    }()
    
    lazy var avatarImage: UIImageView = {
        let avatar = UIImageView(image: UIImage(named: "none"))
        avatar.backgroundColor = UIColor(named: "buttColor")
        avatar.frame = CGRect(x: view.frame.width - (EnvData.paddingUp+EnvData.blockDistance+EnvData.labelHeight+EnvData.blockDistance+EnvData.labelHeight*2)/0.7, y: EnvData.paddingUp+EnvData.labelHeight+EnvData.blockDistance, width: EnvData.paddingUp+EnvData.blockDistance+EnvData.labelHeight+EnvData.blockDistance+EnvData.labelHeight*2, height: EnvData.paddingUp+EnvData.blockDistance+EnvData.labelHeight+EnvData.blockDistance+EnvData.labelHeight*2)
        return avatar
    }()
    
    lazy var pickPhotoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "buttColor")
        button.setTitle("Pickup Photo", for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(pickAction(sender:)), for: .touchUpInside)
        button.frame = CGRect(x: EnvData.paddingLeft, y: 5*EnvData.paddingUp+EnvData.blockDistance+EnvData.labelHeight+EnvData.blockDistance+EnvData.labelHeight, width: view.frame.width-EnvData.paddingLeft*2, height: EnvData.textFieldHeight)
        return button
    }()
    
    lazy var nicknameText: UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.backgroundColor = UIColor.white
        textField.layer.cornerRadius = 10
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = 14
        textField.placeholder = "Enter your nickname..."
        textField.clearButtonMode = .whileEditing
        textField.clearButtonMode = .unlessEditing
        textField.clearButtonMode = .always
        textField.frame = CGRect(x: EnvData.paddingLeft, y: 6*EnvData.paddingUp+EnvData.blockDistance+EnvData.labelHeight+EnvData.blockDistance+EnvData.labelHeight, width: view.frame.width-EnvData.paddingLeft*2, height: EnvData.textFieldHeight)
        return textField
    }()
    
    lazy var passwordText: UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.backgroundColor = UIColor.white
        textField.layer.cornerRadius = 8
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = 14
        textField.placeholder = "Enter your password..."
        textField.clearButtonMode = .whileEditing
        textField.clearButtonMode = .unlessEditing
        textField.clearButtonMode = .always
        textField.isSecureTextEntry = true
        textField.frame = CGRect(x: EnvData.paddingLeft, y: 6*EnvData.paddingUp+EnvData.blockDistance+EnvData.labelHeight+EnvData.blockDistance+EnvData.textFieldHeight+EnvData.blockDistance+EnvData.labelHeight, width: view.frame.width-EnvData.paddingLeft*2, height: EnvData.textFieldHeight)
        return textField
    }()
    
    lazy var passwordTextAgain: UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.backgroundColor = UIColor.white
        textField.layer.cornerRadius = 8
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = 14
        textField.placeholder = "Enter your password again..."
        textField.clearButtonMode = .whileEditing
        textField.clearButtonMode = .unlessEditing
        textField.clearButtonMode = .always
        textField.isSecureTextEntry = true
        textField.frame = CGRect(x: EnvData.paddingLeft, y: 6*EnvData.paddingUp+EnvData.blockDistance+EnvData.labelHeight+EnvData.blockDistance+EnvData.textFieldHeight+EnvData.blockDistance+EnvData.textFieldHeight+EnvData.blockDistance+EnvData.labelHeight, width: view.frame.width-EnvData.paddingLeft*2, height: EnvData.textFieldHeight)
        return textField
    }()
    
    lazy var emailText: UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.backgroundColor = UIColor.white
        textField.layer.cornerRadius = 8
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = 14
        textField.placeholder = "Enter your email..."
        textField.clearButtonMode = .whileEditing
        textField.clearButtonMode = .unlessEditing
        textField.clearButtonMode = .always
        textField.frame = CGRect(x: EnvData.paddingLeft, y: 6*EnvData.paddingUp+EnvData.blockDistance+EnvData.labelHeight+EnvData.blockDistance+EnvData.textFieldHeight+EnvData.blockDistance+EnvData.textFieldHeight+EnvData.blockDistance+EnvData.textFieldHeight+EnvData.blockDistance+EnvData.labelHeight, width: view.frame.width-EnvData.paddingLeft*2, height: EnvData.textFieldHeight)
        return textField
    }()
    
    lazy var phoneText: UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.backgroundColor = UIColor.white
        textField.layer.cornerRadius = 8
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = 14
        textField.placeholder = "Enter your phone..."
        textField.clearButtonMode = .whileEditing
        textField.clearButtonMode = .unlessEditing
        textField.clearButtonMode = .always
        textField.frame = CGRect(x: EnvData.paddingLeft, y: 6*EnvData.paddingUp+EnvData.blockDistance+EnvData.labelHeight+EnvData.blockDistance+EnvData.textFieldHeight+EnvData.blockDistance+EnvData.textFieldHeight+EnvData.blockDistance+EnvData.textFieldHeight+EnvData.blockDistance+EnvData.textFieldHeight+EnvData.blockDistance+EnvData.labelHeight, width: view.frame.width-EnvData.paddingLeft*2, height: EnvData.textFieldHeight)
        return textField
    }()
    
    lazy var registrationButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "buttColor")
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(loginAction(sender:)), for: .touchUpInside)
        button.frame = CGRect(x: EnvData.paddingLeft, y: view.frame.height-EnvData.paddingDown-EnvData.buttonHeight - EnvData.presentModePaddingDown, width: view.frame.width-EnvData.paddingLeft*2, height: EnvData.buttonHeight)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        view.backgroundColor = .gray
        drawInterface()
    }
    
    private func drawInterface() {
        view.addSubview(registrationLabel)
        view.addSubview(avatarImage)
        view.addSubview(pickPhotoButton)
        view.addSubview(nicknameText); textFields.updateValue(nicknameText, forKey: .login)
        view.addSubview(passwordText); textFields.updateValue(passwordText, forKey: .password)
        view.addSubview(passwordTextAgain); textFields.updateValue(passwordTextAgain, forKey: .passwordAgain)
        view.addSubview(emailText); textFields.updateValue(emailText, forKey: .email)
        view.addSubview(phoneText); textFields.updateValue(phoneText, forKey: .phone)
        view.addSubview(registrationButton)
    }
    
    @objc private func pickAction(sender: UIButton) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    @objc private func loginAction(sender: UIButton) {
        let regCheck = RegistrationCheck().isDataNorm(textFields)
        switch regCheck {
        case .loginEmpty:
            showError(message: "Empty login")
        case .loginError:
            showError(message: "Invalid login")
        case .passwordEmpty:
            showError(message: "Empty password")
        case .passwordError:
            showError(message: "Invalid password")
        case .passwordsNotEqual:
            showError(message: "Passwords are not equal")
        case .emailOrPhoneEmpty:
            showError(message: "Email or phone are both empty")
        case .emailError:
            showError(message: "Invalid email")
        case .phoneError:
            showError(message: "Invalid phone number")
        default:
            showError(message: "Everything is good")
        }
    }

}

extension RegistrationVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
                avatarImage.image = image
        }
                
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

}
