//
//  Helpers.swift
//  MoneyMeCodeChallenge
//
//  Created by Sam Xu on 21/7/19.
//  Copyright © 2019 Sam Xu. All rights reserved.
//

import Foundation

extension Double {
    var monthString: String {
        return "\(Int(self)) \(self == 1 ? "month" : "months")"
    }
    
    // round to two decimals
    var currency: Double {
        return (self * 100).rounded() / 100
    }
    
    var currencyString: String {
        return "$\(self.currency)"
    }

}
