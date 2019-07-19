//  Copyright © 2019 Sam Xu. All rights reserved.
//

import SwiftUI
import Combine

struct LoanView : View {
    
    @EnvironmentObject var viewModel: LoanViewModel
    
    private let space: CGFloat = 30
        
    var body: some View {
        NavigationView {
            
            ScrollView {
                VStack(alignment: .center, spacing: space) {
                    
                    VStack(alignment: .leading) {
                        Text("$\(Int(viewModel.amount))")
                        Slider(value: $viewModel.amount, from: viewModel.minAmount, through: viewModel.maxAmount, by: viewModel.amountOffset)
                        HStack {
                            Text("$\(Int(viewModel.minAmount))")
                            Spacer()
                            Text("$\(Int(viewModel.maxAmount))")
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("\(Int(viewModel.months)) \(viewModel.getMonthWord(viewModel.months))")
                        Slider(value: $viewModel.months, from: viewModel.minMonths, through: viewModel.maxMonths, by: viewModel.monthOffset)
                        HStack {
                            Text("\(Int(viewModel.minMonths)) \(viewModel.getMonthWord(viewModel.minMonths))")
                            Spacer()
                            Text("\(Int(viewModel.maxMonths)) \(viewModel.getMonthWord(viewModel.maxMonths))")
                        }
                    }

                    NavigationLink(destination: LoanDetailView(loan: Loan.standard())) {
                        Text("Calculate Quote")
                    }
                    
                }.padding(space)
            }
            .navigationBarTitle("Quote Calculator", displayMode: .inline)
        }
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        let viewModel = LoanViewModel(loan: Loan.standard())
        return LoanView().environmentObject(viewModel)
    }
}

#endif
