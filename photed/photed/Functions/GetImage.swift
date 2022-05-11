//
//  GetImage.swift
//  photed
//
//  Created by Anatoliy Khramchenko on 20.04.2022.
//

import UIKit

extension UIResponder {
    
    func getImage(withLink link: String?, onSucces: @escaping (UIImage) -> (), onError: @escaping (String) -> ()) {
        if let link = link {
            DispatchQueue.main.async {
                let url = URL(string: link)
                do {
                    let data = try Data(contentsOf: url!)
                    if let result = UIImage(data: data) {
                        onSucces(result)
                    } else {
                        onError("Data is not an image")
                    }
                } catch {
                    onError(error.localizedDescription)
                }
            }
            
        } else {
            onError("Link isn't valid")
        }
    }
    
}
