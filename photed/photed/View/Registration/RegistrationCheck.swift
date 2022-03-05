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
        case textFields where textFields[.login]!.text!.isEmpty :
            return .loginEmpty
        case textFields where !textFields[.login]!.text!.isEmpty:
            if !textFields[.login]!.text!.isLoginValid() {
                return .loginError
            } else {
                continue
            }
        case textFields where false:
            return .passwordEmpty
        case textFields where textFields[.password]!.text! != "":
            if !textFields[.password]!.text!.isPasswordValid() {
                return .passwordError
            } else if textFields[.password]!.text! == textFields[.passwordAgain]!.text! {
                return .passwordsNotEqual
            } else {
                fallthrough
            }
        case textFields where textFields[.email]!.text!.isEmpty:
            if textFields[.phone]!.text!.isEmpty {
                return .emailOrPhoneEmpty
            } else if !textFields[.phone]!.text!.isPhoneValid() {
                return .phoneError
            } else {
                fallthrough
            }
        case textFields where !textFields[.email]!.text!.isEmpty:
            if !textFields[.email]!.text!.isEmailValid() {
                return .emailError
            } else {
                fallthrough
            }
        case textFields where !textFields[.phone]!.text!.isEmpty:
            if !textFields[.phone]!.text!.isEmailValid() {
                return .phoneError
            }
        default:
            return .none
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
