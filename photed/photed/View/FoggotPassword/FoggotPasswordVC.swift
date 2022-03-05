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
        let button = UIButton()
        button.backgroundColor = UIColor(named: "buttColor")
        button.setTitle("Send code", for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(sendAction(sender:)), for: .touchUpInside)
        button.frame = CGRect(x: EnvData.paddingLeft, y: EnvData.paddingUp+EnvData.blockDistance*2+EnvData.textFieldHeight+EnvData.segmentHeight, width: view.frame.width-EnvData.paddingLeft*2, height: EnvData.buttonHeight)
        return button
    }()
    
    lazy var codeText: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.backgroundColor = UIColor.white
        textField.layer.cornerRadius = 10
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = 28
        textField.placeholder = "Enter code..."
        textField.clearButtonMode = .whileEditing
        textField.clearButtonMode = .unlessEditing
        textField.clearButtonMode = .always
        textField.keyboardType = .numberPad
        textField.frame = CGRect(x: EnvData.paddingLeft, y: EnvData.paddingUp, width: view.frame.width-EnvData.paddingLeft*2, height: EnvData.textFieldHeight*2)
        textField.layer.borderColor = CGColor.init(red: 100, green: 0, blue: 0, alpha: 1)
        return textField
    }()
    
    lazy var sendCodeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "buttColor")
        button.setTitle("Send code", for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(sendCodeAction(sender:)), for: .touchUpInside)
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
            print("ok")
        }
    }

}