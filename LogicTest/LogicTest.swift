//  Copyright © 2019 Sam Xu. All rights reserved.
//

import XCTest

class LogicTest: XCTestCase {

    func testLoan() {

        let loan = Loan.standard()
        XCTAssertGreaterThanOrEqual(loan.presentValue, loan.minPresentValue)
        XCTAssertLessThanOrEqual(loan.presentValue, loan.maxPresentValue)
        
        XCTAssertGreaterThanOrEqual(loan.numberOfPayments, loan.minNumberOfPayments)
        XCTAssertLessThanOrEqual(loan.numberOfPayments, loan.maxNumberOfPayments)
        
        XCTAssertLessThan(loan.rate, 1.0)
        
        var loan1 = loan
        loan1.presentValue = 4000.0
        XCTAssertNotEqual(loan1, loan)
    }
    
    func testCurrent() {
        //currency should round the double to two digits
        XCTAssertEqual(34.001234.currency, 34.00)
        XCTAssertEqual(34.101234.currency, 34.10)
        XCTAssertEqual(-34.106234.currency, -34.11)
        let a: Double = 34
        XCTAssertEqual(a.currency, 34)
    }
    
    func testPMT() {
        let payment = LoanCalculator().pmt(rate: 0.045, numberOfPayments: 36, amount: 5000).currency
        XCTAssert(payment == 283.03, "monthly payment should 283.03")
    }
    
    func testLoanViewModel() {
        let loan = Loan.standard()
        let viewModel = LoanViewModel(loan: loan)
        
        XCTAssertEqual(loan, viewModel.loan)
        
        XCTAssertEqual(viewModel.amount, loan.presentValue)
        XCTAssertEqual(viewModel.months, loan.numberOfPayments)
        XCTAssertEqual(viewModel.minAmount, loan.minPresentValue)
        XCTAssertEqual(viewModel.maxAmount, loan.maxPresentValue)
        XCTAssertEqual(viewModel.minMonths, loan.minNumberOfPayments)
        XCTAssertEqual(viewModel.maxMonths, loan.maxNumberOfPayments)
        XCTAssertEqual(viewModel.interestRate, loan.rate)
        XCTAssertEqual(viewModel.getMonthWord(1.0), "month")
        XCTAssertEqual(viewModel.getMonthWord(2.0), "months")
        
        viewModel.amount = 4000
        XCTAssertEqual(viewModel.loan.presentValue, 4000)
        
        viewModel.months = 2
        XCTAssertEqual(viewModel.loan.numberOfPayments, 2)
    }
}
