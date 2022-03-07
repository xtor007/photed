//
//  ProfileVC.swift
//  photed
//
//  Created by Берлинский Ярослав Владленович on 06.03.2022.
//

import UIKit

class ProfileVC: UIViewController {
    
    var hideStatusBar: Bool = true {
         didSet {
             setNeedsStatusBarAppearanceUpdate()
         }
     }

     override var prefersStatusBarHidden: Bool {
            return hideStatusBar
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
    }
}
