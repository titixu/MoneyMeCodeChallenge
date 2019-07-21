//  Copyright © 2019 Sam Xu. All rights reserved.
//

import SwiftUI
import Combine

struct LoanDetailView: View {
    
    @EnvironmentObject var viewModel: LoanDetailViewModel
    @State private var isPresentingSheet = false
    @State private var isPresentingAlert = false
    
    // edit user detail
    @State var editing = false
    
    private let space: CGFloat = 30.0
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center, spacing: space) {
                    userGroup()
                    Spacer()
                    loanGroup()
                    if !editing {
                        Button("Apply Now") {
                            self.isPresentingAlert = true
                        }
                    } else {
                        Spacer()
                    }
                }.padding(space)
                
            }.navigationBarTitle("Your qoute", displayMode: .inline)
        }
            // Present Loan view Sheet
        .sheet(isPresented: $isPresentingSheet) {
            Group {
                VStack(alignment: .center, spacing: 30) {
                    Text("Your Quote")
                    LoanEditingView().environmentObject(LoanViewModel(loan: self.viewModel.loan))
                }.padding()
                Spacer()
            }
        }
        .alert(isPresented: $isPresentingAlert) {
            Alert(title: Text("Your Application is Successful"))
        }
    }
    
    private func userGroup() -> some View {
        Group {
            Spacer()
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
            if editing {
                Spacer()
            } else {
                HStack {
                    Text("Finance Detail")
                    Spacer()
                    Button("Edit") {
                        self.isPresentingSheet = true
                    }
                }
                
                HStack {
                    Text("Finance amount")
                    Spacer()
                    Text(viewModel.loan.presentValue.currencyString)
                }
                
                HStack {
                    Spacer()
                    Text("over \(viewModel.loan.numberOfPayments.monthString)").padding(.top, -20)
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
    
}

#if DEBUG
struct LoanDetailView_Previews : PreviewProvider {
    static var previews: some View {
        let viewModel = LoanDetailViewModel(loan: Loan.standard(),
                                            user: UserDefaults.standard.user ?? User.sample(),
                                            storage: UserDefaults.standard)
        return LoanDetailView().environmentObject(viewModel)
    }
}
#endif
