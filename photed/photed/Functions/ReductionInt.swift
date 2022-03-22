//
//  ReductionInt.swift
//  photed
//
//  Created by Anatoliy Khramchenko on 22.03.2022.
//

import Foundation

extension Int {
    
    func reductionInt() -> String? {
        switch self {
        case ..<10000: return String(self)
        case ..<100000:
            if (self%1000)/100 == 0 {
                return "\(self/1000)K"
            }
            return "\(self/1000).\((self%1000)/100)K"
        case ..<1000000: return "\(self/1000)K"
        case ..<10000000:
            if ((self%1000000)/10000) % 10 == 0 {
                if (self%1000000)/10000 == 0 {
                    return "\(self/1000000)M"
                } else {
                    return "\(self/1000000).\((self%1000000)/100000)M"
                }
            } else {
                if (self%1000000)/100000 == 0 {
                    return "\(self/1000000).0\((self%1000000)/10000)M"
                }
            }
            return "\(self/1000000).\((self%1000000)/10000)M"
        case ..<100000000:
            if (self%1000000)/100000 == 0 {
                return "\(self/1000000)M"
            }
            return "\(self/1000000).\((self%1000000)/100000)M"
        case ..<1000000000: return "\(self/1000000)M"
        default: return nil
        }
    }
    
}
