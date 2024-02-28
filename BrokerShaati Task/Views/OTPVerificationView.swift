import SwiftUI

struct OTPVerificationView: View {
    let phoneNumber: String
    @State private var otp: String = ""
    @State private var isNavigationActive: Bool = false
    @State private var showIncorrectOTPMesssage: Bool = false

    var body: some View {
        VStack {
            Text("Enter the 6-digit OTP sent to \(phoneNumber)")
                .font(.title)
                .padding()
            
            TextField("OTP", text: $otp)
                .keyboardType(.numberPad)
                .padding()
                .frame(height: 40)
            
            if showIncorrectOTPMesssage {
                Text("Please enter correct OTP")
                    .foregroundColor(.red)
                    .padding(.bottom)
            }
            
            Button(action: {
               
                if OTPVerificationController.shared.validateOTP(otp) {
                    isNavigationActive = true
                } else {
                    showIncorrectOTPMesssage = true
                }
            }) {
                Text("Continue")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding()
            
            NavigationLink(destination: ProfileScreen(), isActive: $isNavigationActive) {
                EmptyView()
            }
        }
    }
}
#Preview {
    OTPVerificationView(phoneNumber: "1234567890")
}

