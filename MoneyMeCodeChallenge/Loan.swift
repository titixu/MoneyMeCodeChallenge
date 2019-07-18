//
//  Loan.swift
//  MoneyMeCodeChallenge
//
//  Created by Sam Xu on 18/7/19.
//  Copyright © 2019 Sam Xu. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

final class Loan: BindableObject {
    var amount: Double = 2000 {
        didSet { didChange.send(self) }
    }
    
    var months: Double = 2 {
        didSet { didChange.send(self) }
    }
    
    let minAmount: Double = 2000
    let maxAmount: Double = 15000
    let amountOffset: Double = 1000
    
    let minMonths: Double = 2
    let maxMonths: Double = 36
    let monthOffset: Double = 1
    
    let didChange = PassthroughSubject<Loan, Never>()
}
