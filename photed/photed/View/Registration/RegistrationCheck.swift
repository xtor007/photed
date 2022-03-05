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
        case _ where textFields[.login]!.text!.isEmpty || !textFields[.login]!.text!.isLoginValid():
            if textFields[.login]!.text!.isEmpty {
                return .loginEmpty
            } else {
                return .loginError
            }
        case _ where textFields[.password]!.text!.isEmpty || !textFields[.password]!.text!.isPasswordValid():
            if textFields[.password]!.text!.isEmpty {
                return .passwordEmpty
            } else {
                return .passwordError
            }
        case _ where textFields[.password]!.text! != textFields[.passwordAgain]!.text!:
            return .passwordsNotEqual
        case _ where textFields[.email]!.text!.isEmpty && textFields[.phone]!.text!.isEmpty:
            return .emailOrPhoneEmpty
        default:
            switch textFields {
            case _ where textFields[.email]!.text!.isEmpty && !textFields[.phone]!.text!.isPhoneValid():
                return .phoneError
            case _ where textFields[.phone]!.text!.isEmpty && !textFields[.email]!.text!.isEmailValid():
                return .emailError
            default:
                return .none
            }
        }
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
