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
    
    func getAllUsers() -> [User] {
        return [User(id: "fefsb", login: "aboba", email: nil, phone: nil, avatarLink: "https://lifehacker.ru/special/fujifilm/dist/static/img/5.2410a2d.jpg"), User(id: "fefsb", login: "aboba2", email: nil, phone: nil, avatarLink: "https://www.prikol.ru/wp-content/gallery/october-2019/prikol-25102019-001.jpg"),User(id: "fefsb", login: "aboba3", email: nil, phone: nil, avatarLink: nil),User(id: "fefsb", login: "aboba", email: nil, phone: nil, avatarLink: "https://lifehacker.ru/special/fujifilm/dist/static/img/5.2410a2d.jpg"), User(id: "fefsb", login: "aboba2", email: nil, phone: nil, avatarLink: "https://www.prikol.ru/wp-content/gallery/october-2019/prikol-25102019-001.jpg"),User(id: "fefsb", login: "aboba3", email: nil, phone: nil, avatarLink: nil),User(id: "fefsb", login: "aboba", email: nil, phone: nil, avatarLink: "https://lifehacker.ru/special/fujifilm/dist/static/img/5.2410a2d.jpg"), User(id: "fefsb", login: "aboba2", email: nil, phone: nil, avatarLink: "https://www.prikol.ru/wp-content/gallery/october-2019/prikol-25102019-001.jpg"),User(id: "fefsb", login: "aboba3", email: nil, phone: nil, avatarLink: nil),User(id: "fefsb", login: "aboba", email: nil, phone: nil, avatarLink: "https://lifehacker.ru/special/fujifilm/dist/static/img/5.2410a2d.jpg"), User(id: "fefsb", login: "aboba2", email: nil, phone: nil, avatarLink: "https://www.prikol.ru/wp-content/gallery/october-2019/prikol-25102019-001.jpg"),User(id: "fefsb", login: "aboba3", email: nil, phone: nil, avatarLink: nil),User(id: "fefsb", login: "aboba", email: nil, phone: nil, avatarLink: "https://lifehacker.ru/special/fujifilm/dist/static/img/5.2410a2d.jpg"), User(id: "fefsb", login: "aboba2", email: nil, phone: nil, avatarLink: "https://www.prikol.ru/wp-content/gallery/october-2019/prikol-25102019-001.jpg"),User(id: "fefsb", login: "aboba3", email: nil, phone: nil, avatarLink: nil),User(id: "fefsb", login: "aboba", email: nil, phone: nil, avatarLink: "https://lifehacker.ru/special/fujifilm/dist/static/img/5.2410a2d.jpg"), User(id: "fefsb", login: "aboba2", email: nil, phone: nil, avatarLink: "https://www.prikol.ru/wp-content/gallery/october-2019/prikol-25102019-001.jpg"),User(id: "fefsb", login: "aboba3", email: nil, phone: nil, avatarLink: nil),User(id: "fefsb", login: "aboba", email: nil, phone: nil, avatarLink: "https://lifehacker.ru/special/fujifilm/dist/static/img/5.2410a2d.jpg"), User(id: "fefsb", login: "aboba2", email: nil, phone: nil, avatarLink: "https://www.prikol.ru/wp-content/gallery/october-2019/prikol-25102019-001.jpg"),User(id: "fefsb", login: "aboba3", email: nil, phone: nil, avatarLink: nil),User(id: "fefsb", login: "aboba", email: nil, phone: nil, avatarLink: "https://lifehacker.ru/special/fujifilm/dist/static/img/5.2410a2d.jpg"), User(id: "fefsb", login: "aboba2", email: nil, phone: nil, avatarLink: "https://www.prikol.ru/wp-content/gallery/october-2019/prikol-25102019-001.jpg"),User(id: "fefsb", login: "aboba3", email: nil, phone: nil, avatarLink: nil),User(id: "fefsb", login: "aboba", email: nil, phone: nil, avatarLink: "https://lifehacker.ru/special/fujifilm/dist/static/img/5.2410a2d.jpg"), User(id: "fefsb", login: "aboba2", email: nil, phone: nil, avatarLink: "https://www.prikol.ru/wp-content/gallery/october-2019/prikol-25102019-001.jpg"),User(id: "fefsb", login: "aboba3", email: nil, phone: nil, avatarLink: nil),User(id: "fefsb", login: "aboba", email: nil, phone: nil, avatarLink: "https://lifehacker.ru/special/fujifilm/dist/static/img/5.2410a2d.jpg"), User(id: "fefsb", login: "aboba2", email: nil, phone: nil, avatarLink: "https://www.prikol.ru/wp-content/gallery/october-2019/prikol-25102019-001.jpg"),User(id: "fefsb", login: "aboba3", email: nil, phone: nil, avatarLink: nil),User(id: "fefsb", login: "aboba", email: nil, phone: nil, avatarLink: "https://lifehacker.ru/special/fujifilm/dist/static/img/5.2410a2d.jpg"), User(id: "fefsb", login: "aboba2", email: nil, phone: nil, avatarLink: "https://www.prikol.ru/wp-content/gallery/october-2019/prikol-25102019-001.jpg"),User(id: "fefsb", login: "aboba3", email: nil, phone: nil, avatarLink: nil),User(id: "fefsb", login: "aboba", email: nil, phone: nil, avatarLink: "https://lifehacker.ru/special/fujifilm/dist/static/img/5.2410a2d.jpg"), User(id: "fefsb", login: "aboba2", email: nil, phone: nil, avatarLink: "https://www.prikol.ru/wp-content/gallery/october-2019/prikol-25102019-001.jpg"),User(id: "fefsb", login: "aboba3", email: nil, phone: nil, avatarLink: nil)]
    }
    
    func getCountOfLike(loginId: String) -> Int {
        return 100
    }
    
    func getCountOfSee(loginId: String) -> Int {
        return 1000
    }
    
}

// temp DB
let db = APIObj()
