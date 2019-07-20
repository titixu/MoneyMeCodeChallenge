//
//  LoanDetailViewModel.swift
//  MoneyMeCodeChallenge
//
//  Created by Sam Xu on 19/7/19.
//  Copyright © 2019 Sam Xu. All rights reserved.
//

import SwiftUI
import Combine

final class LoanDetailViewModel: BindableObject {
    // MARK: - BindableObject
    let willChange = PassthroughSubject<Void, Never>()
    
    var loan: Loan {
            willSet { willChange.send() }
        }
    
    var user: User {
        willSet {
            storage.user = newValue
            willChange.send()
        }
    }
    
    private var storage: UserStorageProtocol
    
    init(loan: Loan, user: User, storage: UserStorageProtocol) {
        self.loan = loan
        self.user = user
        self.storage = storage
    }
}
