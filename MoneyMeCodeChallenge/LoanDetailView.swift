//  Copyright © 2019 Sam Xu. All rights reserved.
//

import SwiftUI
import Combine

struct LoanDetailView: View {
    
    @EnvironmentObject var viewModel: LoanDetailViewModel
    
    // edit user detail
    @State var editing = false
    
    private let space: CGFloat = 30.0
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center, spacing: space) {
                    userGroup()
                    if !editing {
                        Spacer()
                        loanGroup()
                    }
                }.padding(space)
            }.navigationBarTitle("Your qoute", displayMode: .inline)
        }
    }
    
    private func userGroup() -> some View {
        Group {
            HStack {
                Text("Your information")
                Spacer()
                Button(action: {
                    self.editing.toggle()
                }) {
                    if editing {
                        Text("Done")
                    } else {
                        Text("Edit")
                    }
                }
            }
            
            HStack {
                Text("Name")
                Spacer()
                textField("Name", binding: $viewModel.user.name)
            }
            
            HStack {
                Text("Mobile")
                Spacer()
                textField("Mobile", binding: $viewModel.user.phone)
            }
            
            HStack {
                Text("Email")
                Spacer()
                textField("Email", binding: $viewModel.user.email)
            }
        }
        .multilineTextAlignment(.trailing) // trailing for TextField's text
            .textFieldStyle(RoundedBorderTextFieldStyle.Member.roundedBorder)
    }
    
    private func textField(_ name: String, binding: Binding<String>) -> some View {
        Group {
            if editing {
                TextField(name, text: binding)
            } else {
                Text(binding.value)
            }
        }
        
    }
    
    private func loanGroup() -> some View {
        Group {
            HStack {
                Text("Finance Detail")
                Spacer()
                Button("Edit") { }
            }
            
            HStack {
                Text("Finance amount")
                Spacer()
                Text(viewModel.loan.presentValue.currencyString)
            }
            
            HStack {
                Spacer()
                Text("over \(Int(viewModel.loan.numberOfPayments)) months").padding(.top, -20)
            }

            HStack {
                Text("Repayments from")
                Spacer()
                Text(LoanCalculator().pmt(loan: viewModel.loan).currencyString)
            }
            
            HStack {
                Spacer()
                Text("Monthly").padding(.top, -20)
            }
        }
    }
    
}

#if DEBUG
struct LoanDetailView_Previews : PreviewProvider {
    static var previews: some View {
        let viewModel = LoanDetailViewModel(loan: Loan.standard(), user: UserDefaults.standard.user ?? User.sample(), storage: UserDefaults.standard)
        return LoanDetailView().environmentObject(viewModel)
    }
}
#endif
