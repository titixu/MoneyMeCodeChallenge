//  Copyright © 2019 Sam Xu. All rights reserved.
//

import SwiftUI
import Combine

struct LoanDetailView: View {
    private let space: CGFloat = 30.0
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center, spacing: space) {
                    userGroup()
                    Text("")
                    loanGroup()
                }.padding(space)
            }.navigationBarTitle("Your qoute", displayMode: .inline)
        }
    }
    
    private func userGroup() -> some View {
        Group {
            HStack {
                Text("Your information")
                Spacer()
                Button("Edit") { }
            }
            
            HStack {
                Text("Name")
                Spacer()
                Text("John Doe")
            }
            
            HStack {
                Text("Mobile")
                Spacer()
                Text("04778095252")
            }
            
            HStack {
                Text("Email")
                Spacer()
                Text("johndoe@test.com")
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
                Text("$5,000")
            }
            
            HStack {
                Spacer()
                Text("over 24 months").padding(.top, -20)
            }

            HStack {
                Text("Repoyments from")
                Spacer()
                Text("$56.15")
            }
            
            HStack {
                Spacer()
                Text("Weekly").padding(.top, -20)
            }
        }
    }
    
}

#if DEBUG
struct LoanDetailView_Previews : PreviewProvider {
    static var previews: some View {
        return LoanDetailView()
    }
}
#endif
