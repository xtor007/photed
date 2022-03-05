//
//  FoggotPasswordCheck.swift
//  photed
//
//  Created by Anatoliy Khramchenko on 05.03.2022.
//

import Foundation

class FoggotPasswordCheck {
    
    var code: String?
    
    func isDataNorm(login: String?, way: WayForReestabilish) -> FoggotPasswordErrorLogin {
        if login == nil || login == "" {
            return .loginEmpty
        }
        let db = APIObj()
        let logins = db.getAllLogins()
        if logins.firstIndex(of: login!.lowercased()) == nil {
            return .loginError
        }
        switch way {
        case .email:
            let email = db.getEmailUser(id: db.getIDLogin(login: login!))
            if email == nil {
                return .noEmail
            } else {
                let mailer = Mailer()
                code = mailer.sendCode(email: email!)
            }
        case .phone:
            let phone = db.getPhoneUser(id: db.getIDLogin(login: login!))
            if phone == nil {
                return .noPhone
            } else {
                let smsSender = SMSSender()
                code = smsSender.sendCode(phone: phone!)
            }
        }
        return .none
    }
    
    func isCodeNorm(code: String?) -> FoggotPasswordErrorCode {
        if code == nil || code == "" {
            return .codeEmpty
        }
        if code != self.code {
            return .codeError
        }
        return .none
    }
    
}

enum FoggotPasswordErrorLogin {
    case loginEmpty
    case loginError
    case noPhone
    case noEmail
    case none
}

enum WayForReestabilish {
    case phone
    case email
}

enum FoggotPasswordErrorCode {
    case codeEmpty
    case codeError
    case none
}
