//
//  LoginVC.swift
//  photed
//
//  Created by Anatoliy Khramchenko on 04.03.2022.
//

import UIKit
import UIDrawer

class LoginVC: UIViewController, UIViewControllerTransitioningDelegate {
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "LOGIN"
        label.font = UIFont(name: "HelveticaNeue", size: 40)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .white
        label.frame = CGRect(x: EnvData.paddingLeft, y: EnvData.paddingUp, width: view.frame.width-EnvData.paddingLeft*2, height: EnvData.labelHeight)
        return label
    }()
    
    lazy var loginText: UITextField = {
        let textField = UITextField()
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.backgroundColor = UIColor.white
        textField.layer.cornerRadius = 10
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = 14
        textField.placeholder = "Enter your login..."
        textField.clearButtonMode = .whileEditing
        textField.clearButtonMode = .unlessEditing
        textField.clearButtonMode = .always
        textField.frame = CGRect(x: EnvData.paddingLeft, y: EnvData.paddingUp+EnvData.blockDistance+EnvData.labelHeight, width: view.frame.width-EnvData.paddingLeft*2, height: EnvData.textFieldHeight)
        textField.layer.borderColor = CGColor.init(red: 100, green: 0, blue: 0, alpha: 1)
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
        textField.frame = CGRect(x: EnvData.paddingLeft, y: EnvData.paddingUp+EnvData.blockDistance+EnvData.labelHeight+EnvData.blockDistance+EnvData.textFieldHeight, width: view.frame.width-EnvData.paddingLeft*2, height: EnvData.textFieldHeight)
        textField.layer.borderColor = CGColor.init(red: 100, green: 0, blue: 0, alpha: 1)
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "buttColor")
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(loginAction(sender:)), for: .touchUpInside)
        button.frame = CGRect(x: EnvData.paddingLeft, y: view.frame.height-EnvData.paddingDown-EnvData.buttonHeight, width: view.frame.width-EnvData.paddingLeft*2, height: EnvData.buttonHeight)
        return button
    }()
    
    lazy var regButton: UIButton = {
        let button = UIButton()
        let attributedString = NSMutableAttributedString.init(string: "Register")
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range:
            NSRange.init(location: 0, length: attributedString.length))
        button.setAttributedTitle(attributedString, for: .normal)
        button.addTarget(self, action: #selector(regAction(sender:)), for: .touchUpInside)
        button.setTitleColor(.white, for: .normal)
        button.frame = CGRect(x: EnvData.paddingLeft, y: EnvData.paddingUp+EnvData.blockDistance+EnvData.labelHeight+EnvData.blockDistance+EnvData.textFieldHeight*2+EnvData.blockDistance/2, width: (view.frame.width-EnvData.paddingLeft*2)/2, height: EnvData.littleButtonHeight)
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    lazy var foggotPasswordButton: UIButton = {
        let button = UIButton()
        let attributedString = NSMutableAttributedString.init(string: "Fogot password")
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range:
            NSRange.init(location: 0, length: attributedString.length))
        button.setAttributedTitle(attributedString, for: .normal)
        button.addTarget(self, action: #selector(foggotAction(sender:)), for: .touchUpInside)
        button.setTitleColor(.white, for: .normal)
        button.frame = CGRect(x: view.frame.width/2, y: EnvData.paddingUp+EnvData.blockDistance+EnvData.labelHeight+EnvData.blockDistance+EnvData.textFieldHeight*2+EnvData.blockDistance/2, width: (view.frame.width-EnvData.paddingLeft*2)/2, height: EnvData.littleButtonHeight)
        button.contentHorizontalAlignment = .right
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        view.backgroundColor = .black
        drawInterface()
    }
    
    private func drawInterface() {
        view.addSubview(loginLabel)
        view.addSubview(loginText)
        view.addSubview(passwordText)
        view.addSubview(loginButton)
        view.addSubview(regButton)
        view.addSubview(foggotPasswordButton)
    }
    
    private func clearTextFields() {
        loginText.breakBorder()
        passwordText.breakBorder()
    }
    
    @objc private func loginAction(sender: UIButton) {
        clearTextFields()
        let loginCheck = LoginCheck()
        let error = loginCheck.isDataNorm(login: loginText.text, password: passwordText.text)
        switch error {
        case .loginEmpty:
            showError(message: "Login is empty")
            loginText.paintErrorBorder()
        case .loginError:
            showError(message: "Error login")
            loginText.paintErrorBorder()
        case .passwordEmpty:
            showError(message: "Password is empty")
            passwordText.paintErrorBorder()
        case .passwordError:
            showError(message: "Error in password")
            passwordText.paintErrorBorder()
        case .none:
            print("ok")
        }
    }
    
    @objc private func regAction(sender: UIButton) {
        clearTextFields()
    }
    
    @objc private func foggotAction(sender: UIButton) {
        clearTextFields()
        let foggotPasswordVC = FoggotPasswordVC()
        foggotPasswordVC.modalPresentationStyle = .custom
        foggotPasswordVC.transitioningDelegate = self
        self.present(foggotPasswordVC, animated: true, completion: nil)
    }

}

extension LoginVC {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentationController = DrawerPresentationController(presentedViewController: presented, presenting: presenting, blurEffectStyle: .dark)
        presentationController.topGap = 200
        return presentationController
    }
}
