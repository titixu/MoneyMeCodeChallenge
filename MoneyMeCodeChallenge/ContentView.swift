//
//  ContentView.swift
//  MoneyMeCodeChallenge
//
//  Created by Sam Xu on 17/7/19.
//  Copyright © 2019 Sam Xu. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @EnvironmentObject var loan: Loan
    
    private let space: CGFloat = 30
    
    @State private var isShowingAlert = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: space) {
                Text("Quote Calculator")
                
                VStack(alignment: .leading) {
                    Text("$\(Int(loan.amount))")
                    Slider(value: $loan.amount, from: loan.minAmount, through: loan.maxAmount, by: loan.amountOffset)
                    HStack {
                        Text("$\(Int(loan.minAmount))")
                        Spacer()
                        Text("$\(Int(loan.maxAmount))")
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("\(Int(loan.months)) \(getMonthWord(loan.months))")
                    Slider(value: $loan.months, from: loan.minMonths, through: loan.maxMonths, by: loan.monthOffset)
                    HStack {
                        Text("\(Int(loan.minMonths)) \(getMonthWord(loan.minMonths))")
                        Spacer()
                        Text("\(Int(loan.maxMonths)) \(getMonthWord(loan.maxMonths))")
                    }
                }
                
                Button("Calculate Quote") {
                    self.isShowingAlert = true
                }.presentation($isShowingAlert) {
                    Alert(title: Text("All set"),
                          message: Text("You are borrowing $\(Int(loan.amount)) and payback in \(Int(loan.months)) \(getMonthWord(loan.months))"),
                          dismissButton: .default(Text("Got it!")))
                }
                
            }.padding(space)
        }
    }
    
    private func getMonthWord(_ months: Double) -> String {
        return months == 1 ? "month" : "months"
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        let loan = Loan()
        return ContentView().environmentObject(loan)
    }
}

#endif
