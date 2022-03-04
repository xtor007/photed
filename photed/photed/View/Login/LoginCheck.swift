//
//  LoginCheck.swift
//  photed
//
//  Created by Anatoliy Khramchenko on 04.03.2022.
//

import Foundation

class LoginCheck {
    
    func isDataNorm(login: String?, password: String?) -> LoginError {
        if login == nil || login == "" {
            return .loginEmpty
        }
        let db = APIObj()
        let logins = db.getAllLogins()
        if logins.firstIndex(of: login!.lowercased()) == nil {
            return .loginError
        }
        if password == nil || password == "" {
            return .passwordEmpty
        }
        let realPassword = db.getPassword(for: login!)
        if password != realPassword {
            return .passwordError
        }
        return .none
    }
    
}

enum LoginError {
    case none
    case loginEmpty
    case loginError
    case passwordEmpty
    case passwordError
}
