//  Copyright © 2019 Sam Xu. All rights reserved.
//

import XCTest

class LogicTest: XCTestCase {

    // Test loan object
    func testLoan() {

        let loan = Loan.standard()
        XCTAssertGreaterThanOrEqual(loan.presentValue, loan.minPresentValue)
        XCTAssertLessThanOrEqual(loan.presentValue, loan.maxPresentValue)
        
        XCTAssertGreaterThanOrEqual(loan.numberOfPayments, loan.minNumberOfPayments)
        XCTAssertLessThanOrEqual(loan.numberOfPayments, loan.maxNumberOfPayments)
        
        XCTAssertLessThan(loan.rate, 1.0)
    }
    
    func testCurrent() {
        //currency should round the double to two digits
        XCTAssertEqual(34.001234.currency, 34.00)
        XCTAssertEqual(34.101234.currency, 34.10)
        XCTAssertEqual(-34.106234.currency, -34.11)
        XCTAssertEqual((-34.106234).currencyString, "$-34.11")
        
        let aDouble: Double = 34
        XCTAssertEqual(aDouble.currency, 34)
        XCTAssertEqual(aDouble.currencyString, "$34.00")
    }
    
    func testPMT() {
        let payment = LoanCalculator().pmt(rate: 0.045, numberOfPayments: 36, amount: 5000).currency
        XCTAssert(payment == 283.03, "monthly payment should be 283.03")
        
        let loan = Loan.standard()
        XCTAssertEqual(3135.00, LoanCalculator().pmt(loan: loan).currency)
    }
    
    func testLoanViewModel() {
        let loan = Loan.standard()
        let viewModel = LoanViewModel(loan: loan)
        
        XCTAssertEqual(loan.presentValue, viewModel.loan.presentValue)
        
        XCTAssertEqual(viewModel.amount, "$3000")
        XCTAssertEqual(viewModel.months, "1 month")
        XCTAssertEqual(viewModel.minAmount, "$2000")
        XCTAssertEqual(viewModel.maxAmount, "$15000")
        XCTAssertEqual(viewModel.minMonths, "1 month")
        XCTAssertEqual(viewModel.maxMonths, "36 months")
        
        // test monthString propety
        XCTAssertEqual(1.0.monthString, "1 month")
        XCTAssertEqual(2.0.monthString, "2 months")
        
        viewModel.loan.presentValue = 4000
        XCTAssertEqual(viewModel.loan.presentValue, 4000)
        
        viewModel.loan.numberOfPayments = 2
        XCTAssertEqual(viewModel.loan.numberOfPayments, 2)
    }
}

class UserTest: XCTestCase {
    func testSampleUser() {
        let user = User.sample()
        
        XCTAssertNotEqual(user.id, 0)
        
        XCTAssertEqual(user.name, "John Doe", "Sample user name should be John Doe")
        XCTAssertEqual(user.phone, "04778095252", "Sample user phone should be 04778095252")
        XCTAssertEqual(user.email, "johndoe@test.com", "Sample user email should be johndoe@test.com")
    }
    
    func testUserStorage() {
        var userStorage: UserStorageProtocol = UserDefaults.standard
        
        // first clean up the storage
        userStorage.user = nil
        XCTAssertNil(userStorage.user, "User should be nil after clean up")
        
        userStorage.user = User.sample()
        XCTAssertNotNil(userStorage.user, "User should be the sample user")
    }
    
    func testLoanDetailViewModel() {
        let viewModel = LoanDetailViewModel(loan: Loan.standard(), user: UserDefaults.standard.user ?? User.sample(), storage: UserDefaults.standard)
        
        viewModel.user = User(id: 432, name: "testName", phone: "1234567", email: "test@test.com")
        XCTAssertNotNil(viewModel.user, "User should be the sample user")
        
        let user = viewModel.user
        XCTAssertEqual(user.id, 432)
        XCTAssertEqual(user.name, "testName")
        XCTAssertEqual(user.phone, "1234567")
        XCTAssertEqual(user.email, "test@test.com")
        
        let loan = Loan(presentValue: 43, numberOfPayments: 3, rate: 0.043, minPresentValue: 1, maxPresentValue: 4324, minNumberOfPayments: 1, maxNumberOfPayments: 44)
        viewModel.loan = loan
        
        XCTAssertEqual(viewModel.loan.presentValue, 43)
        XCTAssertEqual(viewModel.loan.numberOfPayments, 3)
        XCTAssertEqual(viewModel.loan.rate, 0.043)
        XCTAssertEqual(viewModel.loan.minPresentValue, 1)
        XCTAssertEqual(viewModel.loan.maxPresentValue, 4324)
        XCTAssertEqual(viewModel.loan.minNumberOfPayments, 1)
        XCTAssertEqual(viewModel.loan.maxNumberOfPayments, 44)
    }
}
