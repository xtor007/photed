//
//  SettingsScreensParamerts.swift
//  photed
//
//  Created by Anatoliy Khramchenko on 22.04.2022.
//

import UIKit

class SettingsScreensParametrs {
    
    static var screens = [
        SettingsScreensParametrs(
            name: "Saved",
            imageName: "bookmark.fill",
            controller: SavedPostsVC()
        ),
        SettingsScreensParametrs(
            name: "Basic",
            imageName: "gear",
            controller: MainSettingsVC()
        ),
        SettingsScreensParametrs(
            name: "Account",
            imageName: "person.fill",
            controller: AccountSettingsVC()
        ),
        SettingsScreensParametrs(
            name: "Information",
            imageName: "info",
            controller: InformationVC()
        )
    ]
    
    let name: String
    let image: UIImage
    let controller: SubsettingsVC
    
    init(name: String, imageName: String, controller: SubsettingsVC) {
        self.name = name
        if let image = UIImage(systemName: imageName) {
            self.image = image
        } else {
            self.image = UIImage()
        }
        self.controller = controller
    }
    
}


