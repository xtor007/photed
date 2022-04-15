//
//  KeyboardSubscribe.swift
//  photed
//
//  Created by Anatoliy Khramchenko on 15.04.2022.
//

import UIKit

extension UIView {
    
    func bindToKeyboard(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }


    @objc func keyboardWillChange(_ notification: NSNotification){
        let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        let beginningFrame = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let deltaY = endFrame.origin.y - beginningFrame.origin.y

        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIView.KeyframeAnimationOptions(rawValue: curve), animations: {
//            if EnvData.isNeedToChangeBackLogin {
//                self.frame.origin.y = EnvData.loginButtonY
//            }
//            EnvData.isNeedToChangeBackLogin.toggle()
            self.frame.origin.y += deltaY
            print(self.frame.origin.y)
        }, completion: nil)
        
//        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIView.KeyframeAnimationOptions(rawValue: curve), animations: {
//            print(self.frame.origin.y)
//            self.frame.origin.y = EnvData.loginButtonY + deltaY
//            print(self.frame.origin.y)
//        }, completion: nil)
    }
    
}
