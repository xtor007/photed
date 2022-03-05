//
//  ShowError.swift
//  photed
//
//  Created by Anatoliy Khramchenko on 04.03.2022.
//

import UIKit

extension UIViewController {
    
    func showError(message: String, handler: ((UIAlertAction) -> Void)? = nil) {
        let alertVC = UIAlertController(
                    title: "ERROR",
                    message: message,
                    preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: handler)
        alertVC.addAction(action)
        self.present(alertVC, animated: true, completion: nil)
    }
    
}
