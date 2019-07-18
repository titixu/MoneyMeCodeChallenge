//
//  Loan.swift
//  MoneyMeCodeChallenge
//
//  Created by Sam Xu on 18/7/19.
//  Copyright © 2019 Sam Xu. All rights reserved.
//

import Foundation

struct Loan: Codable {
    var presentValue: Double
    var numberOfPayments: Double
    var rate: Double
    
    var minPresentValue: Double
    var maxPresentValue: Double
    
    var minNumberOfPayments: Double
    var maxNumberOfPayments: Double
}

extension Loan {
    static func standard() -> Loan {
        return Loan(presentValue: 3000.0,
                    numberOfPayments: 1.0,
                    rate: 0.045,
                    minPresentValue: 2000.0,
                    maxPresentValue: 15000.0,
                    minNumberOfPayments: 1.0,
                    maxNumberOfPayments: 36.0)
    }
}

extension Loan: Equatable {}

struct LoanCalculator {
    
    func pmt(rate : Double, numberOfPayments : Double, amount : Double) -> Double {
        return (amount * rate) / (1 - pow((1 + rate), (-numberOfPayments)))
    }
}

extension Double {
    // round to two decimals
    var currency: Double {
        return (self * 100).rounded() / 100
    }
    
    var currencyString: String {
        return "$\(self.currency)"
    }
}
