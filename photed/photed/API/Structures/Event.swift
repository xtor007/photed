//
//  Event.swift
//  photed
//
//  Created by Anatoliy Khramchenko on 11.05.2022.
//

import Foundation

struct Event: Decodable {
    var login: String
    var type: String //like or dislike
    var postLink: String
    var postId: String //для перехода к посту
}
