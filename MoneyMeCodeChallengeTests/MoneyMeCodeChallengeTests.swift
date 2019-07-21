//  Copyright © 2019 Sam Xu. All rights reserved.
//

import XCTest
@testable import MoneyMeCodeChallenge

class MoneyMeCodeChallengeTests: XCTestCase {

    func testLoanView() {
        let loan = Loan(presentValue: 5000,
                        numberOfPayments: 4,
                        rate: 0.045,
                        minPresentValue: 1000,
                        maxPresentValue: 600000,
                        minNumberOfPayments: 1,
                        maxNumberOfPayments: 72)
        
        let viewModel = LoanViewModel(loan: loan)
        
        XCTAssertEqual(viewModel.amount, "$5000")
    }

}
