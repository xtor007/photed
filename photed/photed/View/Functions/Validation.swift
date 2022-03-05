//
//  Validation.swift
//  photed
//
//  Created by Берлинский Ярослав Владленович on 04.03.2022.
//

import Foundation

struct DB {
    var users: [UserInfo]
}

struct UserInfo {
    var id: String
    var login: String
    var email: String
    var phone: String
    var password: String
}

let DATABASE = DB(users: [])

extension String {
    func isLoginValid() -> Bool {
        for user in DATABASE.users {
            if user.login == self {
               return true
           }
        }
        
        return false
    }
    
    func isPasswordValid() -> Bool {
           let domainRange = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"
           let passwordTest = NSPredicate(format: "SELF MATCHES %@", domainRange)
        return passwordTest.evaluate(with: self)
       }

    func isEmailValid() -> Bool {
        let domainRange = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z.]{2,}"
        for user in DATABASE.users {
            if user.email == self {
               return false
           }
        }
        return NSPredicate(format:"SELF MATCHES %@", domainRange).evaluate(with: self)
    }
    
    func isPhoneValid() -> Bool {
        let domainRange = "^\\(?\\d{3}\\)?[ -]?\\d{3}[ -]?\\d{4}$"
        for user in DATABASE.users {
            if user.phone == self {
               return false
           }
        }
        return NSPredicate(format:"SELF MATCHES %@", domainRange).evaluate(with: self)
    }

}
