//
//  APIObj.swift
//  photed
//
//  Created by Anatoliy Khramchenko on 04.03.2022.
//

import UIKit

//struct UserInfo {
//    var id: String
//    var login: String
//    var email: String
//    var phone: String
//    var password: String
//}
// в другом файле

class APIObj {
    
    //var users: [UserInfo] = [] этот класс не для этого
    
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
    
    func postNewPassword(id: String, password: String) {
        
    }
    
    func getAllEmails() -> [String] {
        return ["tolxpams@gmail.com"]
    }
    
    func getAllPhones() -> [String] {
        return ["+380669214490"]
    }
    
    func postNewUser(avatar: UIImage?, login: String, password: String, email: String?, phone: String?) {
        
    }
    
}

// temp DB
let db = APIObj()
