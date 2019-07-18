//
//  ContentView.swift
//  MoneyMeCodeChallenge
//
//  Created by Sam Xu on 17/7/19.
//  Copyright © 2019 Sam Xu. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView : View {
    
    @EnvironmentObject var loan: LoanViewModel
    
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
                    Text("\(Int(loan.months)) \(loan.getMonthWord(loan.months))")
                    Slider(value: $loan.months, from: loan.minMonths, through: loan.maxMonths, by: loan.monthOffset)
                    HStack {
                        Text("\(Int(loan.minMonths)) \(loan.getMonthWord(loan.minMonths))")
                        Spacer()
                        Text("\(Int(loan.maxMonths)) \(loan.getMonthWord(loan.maxMonths))")
                    }
                }
                
                Button("Calculate Quote") {
                    self.isShowingAlert = true
                }.presentation($isShowingAlert) {
                    Alert(title: Text("All set"),
                          message: Text("You are borrowing $\(Int(loan.amount)) and payback in \(Int(loan.months)) \(loan.getMonthWord(loan.months))"),
                          dismissButton: .default(Text("Got it!")))
                }
                
            }.padding(space)
        }
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        let loan = LoanViewModel(loan: Loan.standard())
        return ContentView().environmentObject(loan)
    }
}

#endif
