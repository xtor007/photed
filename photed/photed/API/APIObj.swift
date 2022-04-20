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
    
    var loginId: String!
    
    func getAllLogins() -> [String] {
        return ["xtor","berlinium"]
    }
    
    func getPassword(for: String) -> String {
        return "1111"
    }
    
    func getIDLogin(login: String) -> String {
        return "id"
    }
    
    func getLoginById(id: String) -> String {
        if id == "id" {
            return "xtor"
        } else {
            return "not_xtor"
        }
    }
    
    func getAvatarLinkById(id: String) -> String? {
        return "https://lifehacker.ru/special/fujifilm/dist/static/img/5.2410a2d.jpg"
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
    
    func getAllUsers(searchQuery: String? = nil) -> [User] {
        if searchQuery == nil {
            return [User(id: "fefsb", login: "aboba", email: nil, phone: nil, avatarLink: "https://lifehacker.ru/special/fujifilm/dist/static/img/5.2410a2d.jpg"), User(id: "fefsb", login: "aboba2", email: nil, phone: nil, avatarLink: "https://www.prikol.ru/wp-content/gallery/october-2019/prikol-25102019-001.jpg"),User(id: "fefsb", login: "aboba3", email: nil, phone: nil, avatarLink: nil),User(id: "fefsb", login: "aboba", email: nil, phone: nil, avatarLink: "https://lifehacker.ru/special/fujifilm/dist/static/img/5.2410a2d.jpg"), User(id: "fefsb", login: "aboba2", email: nil, phone: nil, avatarLink: "https://www.prikol.ru/wp-content/gallery/october-2019/prikol-25102019-001.jpg"),User(id: "fefsb", login: "aboba3", email: nil, phone: nil, avatarLink: nil),User(id: "fefsb", login: "aboba", email: nil, phone: nil, avatarLink: "https://lifehacker.ru/special/fujifilm/dist/static/img/5.2410a2d.jpg"), User(id: "fefsb", login: "aboba2", email: nil, phone: nil, avatarLink: "https://www.prikol.ru/wp-content/gallery/october-2019/prikol-25102019-001.jpg"),User(id: "fefsb", login: "aboba3", email: nil, phone: nil, avatarLink: nil),User(id: "fefsb", login: "aboba", email: nil, phone: nil, avatarLink: "https://lifehacker.ru/special/fujifilm/dist/static/img/5.2410a2d.jpg"), User(id: "fefsb", login: "aboba2", email: nil, phone: nil, avatarLink: "https://www.prikol.ru/wp-content/gallery/october-2019/prikol-25102019-001.jpg"),User(id: "fefsb", login: "aboba3", email: nil, phone: nil, avatarLink: nil),User(id: "fefsb", login: "aboba", email: nil, phone: nil, avatarLink: "https://lifehacker.ru/special/fujifilm/dist/static/img/5.2410a2d.jpg"), User(id: "fefsb", login: "aboba2", email: nil, phone: nil, avatarLink: "https://www.prikol.ru/wp-content/gallery/october-2019/prikol-25102019-001.jpg"),User(id: "fefsb", login: "aboba3", email: nil, phone: nil, avatarLink: nil),User(id: "fefsb", login: "aboba", email: nil, phone: nil, avatarLink: "https://lifehacker.ru/special/fujifilm/dist/static/img/5.2410a2d.jpg"), User(id: "fefsb", login: "aboba2", email: nil, phone: nil, avatarLink: "https://www.prikol.ru/wp-content/gallery/october-2019/prikol-25102019-001.jpg"),User(id: "fefsb", login: "aboba3", email: nil, phone: nil, avatarLink: nil),User(id: "fefsb", login: "aboba", email: nil, phone: nil, avatarLink: "https://lifehacker.ru/special/fujifilm/dist/static/img/5.2410a2d.jpg"), User(id: "fefsb", login: "aboba2", email: nil, phone: nil, avatarLink: "https://www.prikol.ru/wp-content/gallery/october-2019/prikol-25102019-001.jpg"),User(id: "fefsb", login: "aboba3", email: nil, phone: nil, avatarLink: nil),User(id: "fefsb", login: "aboba", email: nil, phone: nil, avatarLink: "https://lifehacker.ru/special/fujifilm/dist/static/img/5.2410a2d.jpg"), User(id: "fefsb", login: "aboba2", email: nil, phone: nil, avatarLink: "https://www.prikol.ru/wp-content/gallery/october-2019/prikol-25102019-001.jpg"),User(id: "fefsb", login: "aboba3", email: nil, phone: nil, avatarLink: nil),User(id: "fefsb", login: "aboba", email: nil, phone: nil, avatarLink: "https://lifehacker.ru/special/fujifilm/dist/static/img/5.2410a2d.jpg"), User(id: "fefsb", login: "aboba2", email: nil, phone: nil, avatarLink: "https://www.prikol.ru/wp-content/gallery/october-2019/prikol-25102019-001.jpg"),User(id: "fefsb", login: "aboba3", email: nil, phone: nil, avatarLink: nil),User(id: "fefsb", login: "aboba", email: nil, phone: nil, avatarLink: "https://lifehacker.ru/special/fujifilm/dist/static/img/5.2410a2d.jpg"), User(id: "fefsb", login: "aboba2", email: nil, phone: nil, avatarLink: "https://www.prikol.ru/wp-content/gallery/october-2019/prikol-25102019-001.jpg"),User(id: "fefsb", login: "aboba3", email: nil, phone: nil, avatarLink: nil),User(id: "fefsb", login: "aboba", email: nil, phone: nil, avatarLink: "https://lifehacker.ru/special/fujifilm/dist/static/img/5.2410a2d.jpg"), User(id: "fefsb", login: "aboba2", email: nil, phone: nil, avatarLink: "https://www.prikol.ru/wp-content/gallery/october-2019/prikol-25102019-001.jpg"),User(id: "fefsb", login: "aboba3", email: nil, phone: nil, avatarLink: nil),User(id: "fefsb", login: "aboba", email: nil, phone: nil, avatarLink: "https://lifehacker.ru/special/fujifilm/dist/static/img/5.2410a2d.jpg"), User(id: "fefsb", login: "aboba2", email: nil, phone: nil, avatarLink: "https://www.prikol.ru/wp-content/gallery/october-2019/prikol-25102019-001.jpg"),User(id: "fefsb", login: "aboba3", email: nil, phone: nil, avatarLink: nil)]
        } else {
            return [User(id: "fefsb", login: "barca", email: nil, phone: nil, avatarLink: "https://lifehacker.ru/special/fujifilm/dist/static/img/5.2410a2d.jpg"), User(id: "fefsb", login: "2", email: nil, phone: nil, avatarLink: "https://www.prikol.ru/wp-content/gallery/october-2019/prikol-25102019-001.jpg"),User(id: "fefsb", login: "3", email: nil, phone: nil, avatarLink: nil),User(id: "fefsb", login: "4", email: nil, phone: nil, avatarLink: "https://lifehacker.ru/special/fujifilm/dist/static/img/5.2410a2d.jpg")]
        }
    }
    
    func getCountOfLike(loginId: String) -> Int {
        return 100
    }
    
    func getCountOfSee(loginId: String) -> Int {
        return 1000
    }
    
    func getAllPosts(loginId: String) -> [Post] {
        return []
        //return [Post(id: "a", photoLink: "https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGhvdG98ZW58MHx8MHx8&w=1000&q=80"),Post(id: "a", photoLink: "https://images.pexels.com/photos/1461974/pexels-photo-1461974.jpeg?cs=srgb&dl=pexels-nextvoyage-1461974.jpg&fm=jpg"),Post(id: "a", photoLink: "https://iso.500px.com/wp-content/uploads/2016/03/stock-photo-142984111.jpg"),Post(id: "a", photoLink: "https://images.unsplash.com/photo-1495745966610-2a67f2297e5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGhvdG9ncmFwaGVyfGVufDB8fDB8fA%3D%3D&w=1000&q=80"),Post(id: "a", photoLink: "https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGhvdG98ZW58MHx8MHx8&w=1000&q=80"),Post(id: "a", photoLink: "https://images.pexels.com/photos/1461974/pexels-photo-1461974.jpeg?cs=srgb&dl=pexels-nextvoyage-1461974.jpg&fm=jpg"),Post(id: "a", photoLink: "https://iso.500px.com/wp-content/uploads/2016/03/stock-photo-142984111.jpg"),Post(id: "a", photoLink: "https://images.unsplash.com/photo-1495745966610-2a67f2297e5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGhvdG9ncmFwaGVyfGVufDB8fDB8fA%3D%3D&w=1000&q=80"),Post(id: "a", photoLink: "https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGhvdG98ZW58MHx8MHx8&w=1000&q=80"),Post(id: "a", photoLink: "https://images.pexels.com/photos/1461974/pexels-photo-1461974.jpeg?cs=srgb&dl=pexels-nextvoyage-1461974.jpg&fm=jpg"),Post(id: "a", photoLink: "https://iso.500px.com/wp-content/uploads/2016/03/stock-photo-142984111.jpg"),Post(id: "a", photoLink: "https://images.unsplash.com/photo-1495745966610-2a67f2297e5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGhvdG9ncmFwaGVyfGVufDB8fDB8fA%3D%3D&w=1000&q=80"),Post(id: "a", photoLink: "https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGhvdG98ZW58MHx8MHx8&w=1000&q=80"),Post(id: "a", photoLink: "https://images.pexels.com/photos/1461974/pexels-photo-1461974.jpeg?cs=srgb&dl=pexels-nextvoyage-1461974.jpg&fm=jpg"),Post(id: "a", photoLink: "https://iso.500px.com/wp-content/uploads/2016/03/stock-photo-142984111.jpg"),Post(id: "a", photoLink: "https://images.unsplash.com/photo-1495745966610-2a67f2297e5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGhvdG9ncmFwaGVyfGVufDB8fDB8fA%3D%3D&w=1000&q=80"),Post(id: "a", photoLink: "https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGhvdG98ZW58MHx8MHx8&w=1000&q=80"),Post(id: "a", photoLink: "https://images.pexels.com/photos/1461974/pexels-photo-1461974.jpeg?cs=srgb&dl=pexels-nextvoyage-1461974.jpg&fm=jpg"),Post(id: "a", photoLink: "https://iso.500px.com/wp-content/uploads/2016/03/stock-photo-142984111.jpg"),Post(id: "a", photoLink: "https://images.unsplash.com/photo-1495745966610-2a67f2297e5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGhvdG9ncmFwaGVyfGVufDB8fDB8fA%3D%3D&w=1000&q=80"),Post(id: "a", photoLink: "https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGhvdG98ZW58MHx8MHx8&w=1000&q=80"),Post(id: "a", photoLink: "https://images.pexels.com/photos/1461974/pexels-photo-1461974.jpeg?cs=srgb&dl=pexels-nextvoyage-1461974.jpg&fm=jpg"),Post(id: "a", photoLink: "https://iso.500px.com/wp-content/uploads/2016/03/stock-photo-142984111.jpg"),Post(id: "a", photoLink: "https://images.unsplash.com/photo-1495745966610-2a67f2297e5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGhvdG9ncmFwaGVyfGVufDB8fDB8fA%3D%3D&w=1000&q=80"),Post(id: "a", photoLink: "https://images.unsplash.com/photo-1495745966610-2a67f2297e5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGhvdG9ncmFwaGVyfGVufDB8fDB8fA%3D%3D&w=1000&q=80")]
    }
    
}

// temp DB
let db = APIObj()
