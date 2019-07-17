//
//  ContentView.swift
//  MoneyMeCodeChallenge
//
//  Created by Sam Xu on 17/7/19.
//  Copyright © 2019 Sam Xu. All rights reserved.
//

import SwiftUI
import Combine

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

struct ContentView : View {
    
    @EnvironmentObject var loan: Loan
    
    let space: CGFloat = 30
    
    @State private var months: Double = 3
    
    var body: some View {
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
                Text("\(Int(loan.months)) \( loan.months == 1 ? "month" : "months" )")
                Slider(value: $loan.months, from: loan.minMonths, through: loan.maxMonths, by: loan.monthOffset)
                HStack {
                    Text("\(Int(loan.minMonths)) \( loan.minMonths == 1 ? "month" : "months" )")
                    Spacer()
                    Text("\(Int(loan.maxMonths)) \( loan.maxMonths == 1 ? "month" : "months" )")
                }
            }
            
            Button("Calculate Quote") {
                print("Test")
            }
            
        }.padding(space)
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
