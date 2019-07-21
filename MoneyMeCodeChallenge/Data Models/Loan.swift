//  Copyright © 2019 Sam Xu. All rights reserved.
//

import Foundation

class Loan {
    
    var presentValue: Double
    var numberOfPayments: Double
    var rate: Double
    
    var minPresentValue: Double
    var maxPresentValue: Double
    
    var minNumberOfPayments: Double
    var maxNumberOfPayments: Double
    
    init(presentValue: Double,
         numberOfPayments: Double,
         rate: Double,
         minPresentValue: Double,
         maxPresentValue: Double,
         minNumberOfPayments: Double,
         maxNumberOfPayments: Double) {
        self.presentValue = presentValue
        self.numberOfPayments = numberOfPayments
        self.rate = rate
        self.minPresentValue = minPresentValue
        self.maxPresentValue = maxPresentValue
        self.minNumberOfPayments = minNumberOfPayments
        self.maxNumberOfPayments = maxNumberOfPayments
    }
}

extension Loan {
    static func standard() -> Loan {
        Loan(presentValue: 3000.0,
             numberOfPayments: 1.0,
             rate: 0.045,
             minPresentValue: 2000.0,
             maxPresentValue: 15000.0,
             minNumberOfPayments: 1.0,
             maxNumberOfPayments: 36.0)
    }
}

struct LoanCalculator {
    
    func pmt(rate : Double, numberOfPayments : Double, amount : Double) -> Double {
        (amount * rate) / (1 - pow((1 + rate), (-numberOfPayments)))
    }
}

extension LoanCalculator {
    func pmt(loan: Loan) -> Double {
        pmt(rate: loan.rate, numberOfPayments: loan.numberOfPayments, amount: loan.presentValue)
    }
}
