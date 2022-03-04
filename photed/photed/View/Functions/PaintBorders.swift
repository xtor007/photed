//
//  Paint Borders.swift
//  photed
//
//  Created by Anatoliy Khramchenko on 04.03.2022.
//

import UIKit

extension UIView {
    
    func paintErrorBorder() {
        layer.borderWidth = CGFloat(1)
    }
    
    func breakBorder() {
        layer.borderWidth = CGFloat(0)
    }
    
}
