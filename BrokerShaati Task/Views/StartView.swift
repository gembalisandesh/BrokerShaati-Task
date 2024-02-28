import SwiftUI

struct StartView: View {
    @State private var phoneNumber: String = ""
    @State private var isNextViewActive: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                BannerView()
                
                Text("Enter your mobile number")
                    .font(.title)
                    .padding()
                
                TextField("Mobile number", text: $phoneNumber)
                    .keyboardType(.numberPad)
                    .padding()
                    .frame(height: 40)
                
                Button(action: {
                   
                    if StartController.shared.validatePhoneNumber(phoneNumber) {
                        isNextViewActive = true
                    } else {
                        
                    }
                }) {
                    Text("Let's Go")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()
                
                NavigationLink(destination: OTPVerificationView(phoneNumber: phoneNumber), isActive: $isNextViewActive) {
                    EmptyView()
                }
            }
        }
    }
}
#Preview {
    StartView()
}
