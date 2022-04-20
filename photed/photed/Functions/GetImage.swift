//
//  GetImage.swift
//  photed
//
//  Created by Anatoliy Khramchenko on 20.04.2022.
//

import UIKit

extension UIViewController {
    
    func getImage(link: String?) async throws -> UIImage? {
        if link != nil {
            let url = URL(string: link!)
            if let data = try? Data(contentsOf: url!) {
                return UIImage(data: data)
            }
        }
        return nil
    }
    
}
