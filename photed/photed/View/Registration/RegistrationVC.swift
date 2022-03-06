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
    private var isAvatarSet = false
        
    lazy var registrationLabel: UILabel = {
        let label = standartLable()
        label.text = "REGISTRATION"
        label.frame = CGRect(x: EnvData.paddingLeft, y: EnvData.paddingUp, width: view.frame.width-EnvData.paddingLeft*2, height: EnvData.labelHeight)
        return label
    }()
    
    lazy var avatarImage: UIImageView = {
        let avatar = standartAvatar()
        //avatar.backgroundColor = UIColor(named: "buttColor")
        avatar.frame = CGRect(x: (view.frame.width-EnvData.bigAvatarHeight)/2, y: EnvData.paddingUp+EnvData.labelHeight+EnvData.blockDistance, width: EnvData.bigAvatarHeight, height: EnvData.bigAvatarHeight)
        return avatar
    }()
    
    lazy var pickPhotoButton: UIButton = {
        let button = standartButton()
        button.setTitle("Pickup Photo", for: .normal)
        button.addTarget(self, action: #selector(pickAction(sender:)), for: .touchUpInside)
        button.frame = CGRect(x: EnvData.paddingLeft, y: EnvData.paddingUp+EnvData.labelHeight+EnvData.blockDistance*2+EnvData.bigAvatarHeight, width: view.frame.width-EnvData.paddingLeft*2, height: EnvData.buttonHeight/2)
        return button
    }()
    
    lazy var loginText: UITextField = {
        let textField = standartTextField()
        textField.placeholder = "Enter your login..."
        textField.frame = CGRect(x: EnvData.paddingLeft, y: EnvData.paddingUp+EnvData.labelHeight+EnvData.blockDistance*3+EnvData.bigAvatarHeight+EnvData.buttonHeight/2, width: view.frame.width-EnvData.paddingLeft*2, height: EnvData.textFieldHeight)
        return textField
    }()
    
    lazy var passwordText: UITextField = {
        let textField = standartPasswordTextField()
        textField.placeholder = "Enter your password..."
        textField.frame = CGRect(x: EnvData.paddingLeft, y: EnvData.paddingUp+EnvData.labelHeight+EnvData.blockDistance*4+EnvData.bigAvatarHeight+EnvData.buttonHeight/2+EnvData.textFieldHeight, width: view.frame.width-EnvData.paddingLeft*2, height: EnvData.textFieldHeight)
        return textField
    }()
    
    lazy var passwordTextAgain: UITextField = {
        let textField = standartPasswordTextField()
        textField.placeholder = "Enter your password again..."
        textField.frame = CGRect(x: EnvData.paddingLeft, y: EnvData.paddingUp+EnvData.labelHeight+EnvData.blockDistance*5+EnvData.bigAvatarHeight+EnvData.buttonHeight/2+EnvData.textFieldHeight*2, width: view.frame.width-EnvData.paddingLeft*2, height: EnvData.textFieldHeight)
        return textField
    }()
    
    lazy var emailText: UITextField = {
        let textField = standartTextField()
        textField.placeholder = "Enter your email..."
        textField.frame = CGRect(x: EnvData.paddingLeft, y: EnvData.paddingUp+EnvData.labelHeight+EnvData.blockDistance*6+EnvData.bigAvatarHeight+EnvData.buttonHeight/2+EnvData.textFieldHeight*3, width: view.frame.width-EnvData.paddingLeft*2, height: EnvData.textFieldHeight)
        return textField
    }()
    
    lazy var phoneText: UITextField = {
        let textField = standartTextField()
        textField.placeholder = "Enter your phone..."
        textField.frame = CGRect(x: EnvData.paddingLeft, y: EnvData.paddingUp+EnvData.labelHeight+EnvData.blockDistance*7+EnvData.bigAvatarHeight+EnvData.buttonHeight/2+EnvData.textFieldHeight*4, width: view.frame.width-EnvData.paddingLeft*2, height: EnvData.textFieldHeight)
        return textField
    }()
    
    lazy var registrationButton: UIButton = {
        let button = standartButton()
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(loginAction(sender:)), for: .touchUpInside)
        button.frame = CGRect(x: EnvData.paddingLeft, y: view.frame.height-EnvData.paddingDown-EnvData.buttonHeight - EnvData.presentModePaddingDown, width: view.frame.width-EnvData.paddingLeft*2, height: EnvData.buttonHeight)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        view.backgroundColor = .gray
        drawInterface()
        loginText.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
//        for textField in textFields.values {
//            textField.addTarget(self, action: #selector(self.textFieldDidTaped(_:)), for: UIControl.Event.editingChanged)
//        }
        //проще ж прописать внутри самих штук
    }
    
    private func clearTextFields() {
        loginText.breakBorder()
        passwordText.breakBorder()
        passwordTextAgain.breakBorder()
        emailText.breakBorder()
        phoneText.breakBorder()
    }
    
    private func drawInterface() {
        view.addSubview(registrationLabel)
        view.addSubview(avatarImage)
        view.addSubview(pickPhotoButton)
        view.addSubview(loginText); textFields.updateValue(loginText, forKey: .login)
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
        clearTextFields()
        let regCheck = RegistrationCheck().isDataNorm(textFields)
        switch regCheck {
        case _ where regCheck == .loginEmpty || regCheck == .loginError:
            _ = regCheck == .loginEmpty ? showError(message: "Empty login") : showError(message: "Invalid login")
            loginText.paintErrorBorder()
        case _ where regCheck == .passwordEmpty || regCheck == .passwordError:
            _ = regCheck == .passwordEmpty ? showError(message: "Empty password") : showError(message: "Invalid password")
            passwordText.paintErrorBorder()
        case .passwordsNotEqual:
            showError(message: "Passwords are not equal")
            passwordText.paintErrorBorder()
            passwordTextAgain.paintErrorBorder()
        case .emailOrPhoneEmpty:
            showError(message: "Email or phone are both empty")
            emailText.paintErrorBorder()
            phoneText.paintErrorBorder()
        case .emailError:
            showError(message: "Invalid email")
            emailText.paintErrorBorder()
        case .phoneError:
            showError(message: "Invalid phone number")
            phoneText.paintErrorBorder()
        default:
            let image = isAvatarSet ? avatarImage.image : nil
            db.postNewUser(avatar: image, login: loginText.text!, password: passwordText.text!, email: emailText.text, phone: phoneText.text)
            dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
            if let text:String = textField.text {
                DispatchQueue.main.async {
                    self.loginText.text = text.lowercased()
                }
            }
    }
}

extension RegistrationVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            avatarImage.image = image
            isAvatarSet = true
        }
                
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

}
