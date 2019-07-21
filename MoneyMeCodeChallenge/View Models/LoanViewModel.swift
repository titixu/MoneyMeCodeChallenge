//  Copyright © 2019 Sam Xu. All rights reserved.
//

import SwiftUI
import Combine

final class LoanViewModel: BindableObject {
    
    var loan: Loan {
        willSet { willChange.send() }
    }
    
    var amount: String {
       "$\(Int(loan.presentValue))"
    }
    
    var minAmount: String {
        "$\(Int(loan.minPresentValue))"
    }
    
    var maxAmount: String {
        "$\(Int(loan.maxPresentValue))"
    }
    
    let amountOffset: Double = 1000
    
    var months: String {
        loan.numberOfPayments.monthString
    }
    
    var minMonths: String {
        loan.minNumberOfPayments.monthString
    }
    
    var maxMonths: String {
        loan.maxNumberOfPayments.monthString
    }
    
    let monthOffset: Double = 1
    
    let willChange = PassthroughSubject<Void, Never>()
 
    var loadDetailViewModel: LoanDetailViewModel {
            LoanDetailViewModel(loan: loan, user: UserDefaults.standard.user ?? User.sample(), storage: UserDefaults.standard)
        }

    init(loan: Loan) {
        self.loan = loan
    }
}
