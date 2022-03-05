//
//  RegistrationCheck.swift
//  photed
//
//  Created by Берлинский Ярослав Владленович on 05.03.2022.
//

import Foundation
import UIKit

class RegistrationCheck {
    
    func isDataNorm(_ textFields: [Field : UITextField]) -> RegistrationError {
        switch textFields {
        case textFields where textFields[.login]?.text == nil:
            return .loginEmpty
        case textFields where textFields[.login]?.text != nil:
            if !textFields[.login]!.text!.isLoginValid() {
                return .loginError
            } else {
                fallthrough
            }
        case textFields where textFields[.password]?.text == nil:
            return .passwordEmpty
        case textFields where textFields[.password]?.text != nil:
            if !textFields[.password]!.text!.isPasswordValid() {
                return .passwordError
            } else if textFields[.password]!.text! == textFields[.passwordAgain]!.text! {
                return .passwordsNotEqual
            } else {
                fallthrough
            }
        case textFields where textFields[.email]?.text == nil:
            if textFields[.phone]?.text == nil {
                return .emailOrPhoneEmpty
            } else if !textFields[.phone]!.text!.isPhoneValid() {
                return .phoneError
            }
        case textFields where textFields[.email]?.text != nil:
            if !textFields[.email]!.text!.isEmailValid() {
                return .loginEmpty
            } else {
                fallthrough
            }
        default:
            <#code#>
        }
        if textFields where textFields[.login].description.isEmailValid()  {
            <#code#>
        }
        return .none
    }
    
}

enum RegistrationError {
    case none
    case loginEmpty
    case loginError
    case passwordEmpty
    case passwordError
    case passwordsNotEqual
    case emailOrPhoneEmpty
    case emailError
    case phoneError
}
