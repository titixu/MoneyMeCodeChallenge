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
    
    @EnvironmentObject var viewModel: LoanViewModel
    
    private let space: CGFloat = 30
    
    @State private var isShowingAlert = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: space) {
                Text("Quote Calculator")
                
                VStack(alignment: .leading) {
                    Text("$\(Int(viewModel.amount))")
                    Slider(value: $loan.amount, from: viewModel.minAmount, through: viewModel.maxAmount, by: viewModel.amountOffset)
                    HStack {
                        Text("$\(Int(viewModel.minAmount))")
                        Spacer()
                        Text("$\(Int(viewModel.maxAmount))")
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("\(Int(viewModel.months)) \(viewModel.getMonthWord(viewModel.months))")
                    Slider(value: $loan.months, from: viewModel.minMonths, through: viewModel.maxMonths, by: viewModel.monthOffset)
                    HStack {
                        Text("\(Int(viewModel.minMonths)) \(viewModel.getMonthWord(viewModel.minMonths))")
                        Spacer()
                        Text("\(Int(viewModel.maxMonths)) \(viewModel.getMonthWord(viewModel.maxMonths))")
                    }
                }
                
                Button("Calculate Quote") {
                    self.isShowingAlert = true
                }.presentation($isShowingAlert) {
                    Alert(title: Text("All set"),
                          message: Text("You are borrowing $\(Int(viewModel.amount)) and payback in \(Int(viewModel.months)) \(viewModel.getMonthWord(viewModel.months))"),
                          dismissButton: .default(Text("Got it!")))
                }
                
            }.padding(space)
        }
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        let viewModel = LoanViewModel(viewModel: Loan.standard())
        return ContentView().environmentObject(viewModel)
    }
}

#endif
