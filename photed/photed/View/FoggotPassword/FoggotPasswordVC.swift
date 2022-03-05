//
//  FoggotPasswordVC.swift
//  photed
//
//  Created by Anatoliy Khramchenko on 04.03.2022.
//

import UIKit

class FoggotPasswordVC: UIViewController {
    
    lazy var loginText: UITextField = {
        let textField = UITextField()
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
    
    @objc private func sendAction(sender: UIButton) {
        
    }

}
