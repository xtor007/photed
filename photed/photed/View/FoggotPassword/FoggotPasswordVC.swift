//
//  FoggotPasswordVC.swift
//  photed
//
//  Created by Anatoliy Khramchenko on 04.03.2022.
//

import UIKit

class FoggotPasswordVC: UIViewController {
    
    private let foggotPasswordCheck = FoggotPasswordCheck()
    
    lazy var loginText: UITextField = {
        let textField = standartTextField()
        textField.placeholder = "Enter your login..."
        textField.frame = CGRect(x: EnvData.paddingLeft, y: EnvData.paddingUp, width: view.frame.width-EnvData.paddingLeft*2, height: EnvData.textFieldHeight)
        textField.layer.borderColor = CGColor.init(red: 100, green: 0, blue: 0, alpha: 1)
        return textField
    }()
    
    lazy var selectWaySegmentedControl: UISegmentedControl = {
        let segmentetControl = UISegmentedControl(items: ["Email","Phone"])
        segmentetControl.backgroundColor = .white
        segmentetControl.selectedSegmentIndex = 0
        segmentetControl.frame = CGRect(x: EnvData.paddingLeft, y: EnvData.paddingUp+EnvData.blockDistance+EnvData.textFieldHeight, width: view.frame.width-EnvData.paddingLeft*2, height: EnvData.segmentHeight)
        return segmentetControl
    }()
    
    lazy var sendButton: UIButton = {
        let button = standartButton()
        button.setTitle("Send code", for: .normal)
        button.addTarget(self, action: #selector(sendAction(sender:)), for: .touchUpInside)
        button.frame = CGRect(x: EnvData.paddingLeft, y: EnvData.paddingUp+EnvData.blockDistance*2+EnvData.textFieldHeight+EnvData.segmentHeight, width: view.frame.width-EnvData.paddingLeft*2, height: EnvData.buttonHeight)
        return button
    }()
    
    lazy var codeText: UITextField = {
        let textField = standartTextField()
        textField.textAlignment = .center
        textField.minimumFontSize = 28
        textField.placeholder = "Enter code..."
        textField.keyboardType = .numberPad
        textField.frame = CGRect(x: EnvData.paddingLeft, y: EnvData.paddingUp, width: view.frame.width-EnvData.paddingLeft*2, height: EnvData.textFieldHeight*2)
        return textField
    }()
    
    lazy var sendCodeButton: UIButton = {
        let button = standartButton()
        button.setTitle("Send code", for: .normal)
        button.addTarget(self, action: #selector(sendCodeAction(sender:)), for: .touchUpInside)
        button.frame = CGRect(x: EnvData.paddingLeft, y: EnvData.paddingUp+EnvData.blockDistance*2+EnvData.textFieldHeight+EnvData.segmentHeight, width: view.frame.width-EnvData.paddingLeft*2, height: EnvData.buttonHeight)
        return button
    }()
    
    lazy var passwordText: UITextField = {
        let textField = standartPasswordTextField()
        textField.placeholder = "Enter your password..."
        textField.frame = CGRect(x: EnvData.paddingLeft, y: EnvData.paddingUp, width: view.frame.width-EnvData.paddingLeft*2, height: EnvData.textFieldHeight)
        return textField
    }()
    
    lazy var passwordTextAgain: UITextField = {
        let textField = standartPasswordTextField()
        textField.placeholder = "Enter your password again..."
        textField.frame = CGRect(x: EnvData.paddingLeft, y: EnvData.paddingUp+EnvData.textFieldHeight+EnvData.blockDistance, width: view.frame.width-EnvData.paddingLeft*2, height: EnvData.textFieldHeight)
        return textField
    }()
    
    lazy var enterButton: UIButton = {
        let button = standartButton()
        button.setTitle("Enter", for: .normal)
        button.addTarget(self, action: #selector(enterAction(sender:)), for: .touchUpInside)
        button.frame = CGRect(x: EnvData.paddingLeft, y: EnvData.paddingUp+EnvData.blockDistance*2+EnvData.textFieldHeight+EnvData.segmentHeight, width: view.frame.width-EnvData.paddingLeft*2, height: EnvData.buttonHeight)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        view.backgroundColor = .gray
        drawInterface()
    }
    
    private func drawInterface() {
        view.addSubview(loginText)
        view.addSubview(selectWaySegmentedControl)
        view.addSubview(sendButton)
    }
    
    private func clearTextFields() {
        loginText.breakBorder()
        codeText.breakBorder()
        passwordText.breakBorder()
        passwordTextAgain.breakBorder()
    }
    
    private func showCodeWrite() {
        loginText.isHidden = true
        selectWaySegmentedControl.isHidden = true
        sendButton.isHidden = true
        view.addSubview(codeText)
        view.addSubview(sendCodeButton)
    }
    
    private func showEnterNewPassword() {
        codeText.isHidden = true
        sendCodeButton.isHidden = true
        view.addSubview(passwordText)
        view.addSubview(passwordTextAgain)
        view.addSubview(enterButton)
    }
    
    @objc private func sendAction(sender: UIButton) {
        clearTextFields()
        let way = selectWaySegmentedControl.selectedSegmentIndex == 0 ? WayForReestabilish.email : WayForReestabilish.phone
        let error = foggotPasswordCheck.isDataNorm(login: loginText.text, way: way)
        switch error {
        case .loginEmpty:
            showError(message: "Login is empty")
            loginText.paintErrorBorder()
        case .loginError:
            showError(message: "Error in login")
            loginText.paintErrorBorder()
        case .noEmail:
            showError(message: "You haven't email")
        case .noPhone:
            showError(message: "You haven't phone")
        case .none:
            showCodeWrite()
        }
    }
    
    @objc private func sendCodeAction(sender: UIButton) {
        clearTextFields()
        let error = foggotPasswordCheck.isCodeNorm(code: codeText.text)
        switch error {
        case .codeEmpty:
            showError(message: "Code is empty")
            codeText.paintErrorBorder()
        case .codeError:
            showError(message: "Code is incorrect. Try again", handler: {(alert: UIAlertAction!) in
                self.dismiss(animated: true)
            })
        case .none:
            showEnterNewPassword()
        }
    }
    
    @objc private func enterAction(sender: UIButton) {
        clearTextFields()
        let error = foggotPasswordCheck.isPasswordNorm(password: passwordText.text, rePassword: passwordTextAgain.text)
        switch error {
        case .passwordEmpty:
            showError(message: "Password is empty")
            passwordText.paintErrorBorder()
        case .passwordError:
            showError(message: "Error in password")
            passwordText.paintErrorBorder()
        case .rePasswordEmpty:
            showError(message: "Second password is empty")
            passwordTextAgain.paintErrorBorder()
        case .rePasswordError:
            showError(message: "Passwords do not match")
            passwordTextAgain.paintErrorBorder()
        case .none:
            APIObj.db.postNewPassword(id: APIObj.db.getIDLogin(login: loginText.text!), password: passwordText.text!)
            dismiss(animated: true)
        }
    }

}
