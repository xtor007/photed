//
//  APIObj.swift
//  photed
//
//  Created by Anatoliy Khramchenko on 04.03.2022.
//

import Foundation

class APIObj {
    
    func getAllLogins() -> [String] {
        return ["xtor","berlinium"]
    }
    
    func getPassword(for: String) -> String {
        return "1111"
    }
    
    func getIDLogin(login: String) -> String {
        return "id"
    }
    
    func getEmailUser(id: String) -> String? {
        return "tolxpams@gmail.com"
    }
    
    func getPhoneUser(id: String) -> String? {
        return nil
    }
    
}
