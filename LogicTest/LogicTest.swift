//
//  LogicTest.swift
//  LogicTest
//
//  Created by Sam Xu on 18/7/19.
//  Copyright © 2019 Sam Xu. All rights reserved.
//

import XCTest

class LogicTest: XCTestCase {

    func testLoan() {
//        let loan = Loan(amount: 2000, months: 2)
        
    }
    
    func testCurrent() {
        XCTAssertEqual(34.001234.currency, 34.00, "should round to 34.00")
        XCTAssertEqual(34.101234.currency, 34.10, "should round to 34.10")
        XCTAssertEqual(-34.106234.currency, -34.11, "should round to -34.11")
    }
    
    func testPMT() {
        let payment = LoanCalculator().pmt(rate: 0.045, numberOfPayments: 36, amount: 5000).currency
        XCTAssert(payment == 283.03, "monthly payment should 283.03")
    }

}
