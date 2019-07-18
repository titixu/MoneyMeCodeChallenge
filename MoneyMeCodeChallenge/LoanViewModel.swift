//
//  LoanViewModel.swift
//  MoneyMeCodeChallenge
//
//  Created by Sam Xu on 18/7/19.
//  Copyright © 2019 Sam Xu. All rights reserved.
//

import SwiftUI
import Combine

final class LoanViewModel: BindableObject {
    var loan: Loan {
        didSet { didChange.send(self) }
    }
    
    var amount: Double {
        get { loan.presentValue }
        set { loan.presentValue = newValue }
    }
    
    var months: Double {
        get { loan.numberOfPayments }
        set { loan.numberOfPayments = newValue }
    }
    
    var interestRate: Double {
        return loan.rate
    }
    
    var minAmount: Double {
        return loan.minPresentValue
    }
    
    var maxAmount: Double {
        return loan.maxPresentValue
    }
    
    let amountOffset: Double = 1000
    
    var minMonths: Double {
        return loan.minNumberOfPayments
    }
    
    var maxMonths: Double {
        return loan.maxNumberOfPayments
    }
    
    let monthOffset: Double = 1
    
    let didChange = PassthroughSubject<LoanViewModel, Never>()
    
    init(loan: Loan) {
        self.loan = loan
    }
    
    func getMonthWord(_ months: Double) -> String {
        return months == 1 ? "month" : "months"
    }
}
