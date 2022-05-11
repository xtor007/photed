//
//  Validation.swift
//  photed
//
//  Created by Берлинский Ярослав Владленович on 04.03.2022.
//

import Foundation

extension String {
    func isLoginValid() -> Bool {
        if APIObj.db.getAllLogins().firstIndex(of: self) != nil {
            return false
        }
        let domainRange =  "(?:)([A-Za-z0-9_](?:(?:[A-Za-z0-9_]|(?:\\.(?!\\.))){0,28}(?:[A-Za-z0-9_]))?)"
        let loginTest = NSPredicate(format: "SELF MATCHES %@", domainRange)
        return loginTest.evaluate(with: self)
    }
    
    func isPasswordValid() -> Bool {
           let domainRange = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"
           let passwordTest = NSPredicate(format: "SELF MATCHES %@", domainRange)
        return passwordTest.evaluate(with: self)
       }

    func isEmailValid() -> Bool {
        let domainRange = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z.]{2,}"
        if APIObj.db.getAllEmails().firstIndex(of: self) != nil {
            return false
        }
        return NSPredicate(format:"SELF MATCHES %@", domainRange).evaluate(with: self)
    }
    
    func isPhoneValid() -> Bool {
        //let domainRange = "^\\(?\\d{3}\\)?[ -]?\\d{3}[ -]?\\d{4}$"
        let domainRange = "^((\\+)|(00))[0-9]{6,14}$"
        if APIObj.db.getAllPhones().firstIndex(of: self) != nil {
            return false
        }
        return NSPredicate(format:"SELF MATCHES %@", domainRange).evaluate(with: self)
    }

}
