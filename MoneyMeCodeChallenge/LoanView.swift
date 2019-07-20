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
                        Text(viewModel.amount)
                        
                        Slider(value: $viewModel.loan.presentValue, from: viewModel.loan.minPresentValue, through: viewModel.loan.maxPresentValue, by: viewModel.amountOffset)
                        HStack {
                            Text(viewModel.minAmount)
                            Spacer()
                            Text(viewModel.maxAmount)
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text(viewModel.months)
                        Slider(value: $viewModel.loan.numberOfPayments, from: viewModel.loan.minNumberOfPayments, through: viewModel.loan.maxNumberOfPayments, by: viewModel.monthOffset)
                        HStack {
                            Text(viewModel.minMonths)
                            Spacer()
                            Text(viewModel.maxMonths)
                        }
                    }

                    NavigationLink(destination: LoanDetailView().environmentObject(viewModel.loadDetailViewModel)) {
                        Text("Calculate Quote")
                    }
                    
                }.padding()
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
