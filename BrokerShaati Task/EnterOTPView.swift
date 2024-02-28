//
//  EnterOTPView.swift
//  BrokerShaati Task
//
//  Created by Reddy Bharadwaj Chowdary on 27/02/24.
//

import SwiftUI

struct EnterOTPView: View {
    let mobileNumber: String
    @State private var otp = ""
    @State private var showAlert = false
    @State private var resendDisabled = false
    
    var body: some View {
        VStack {
            Text("Enter OTP sent to \(mobileNumber)")
                .padding()
            
            TextField("Enter OTP", text: $otp)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            
            Button("Verify OTP") {
                verifyOTP()
            }
            .padding()
            
            Button(action: {
                // Implement resend OTP functionality here
                resendDisabled = true
                // Simulating resend OTP functionality
                DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
                    resendDisabled = false
                }
            }) {
                Text("Didn't receive OTP? Resend")
                    .foregroundColor(resendDisabled ? .gray : .blue)
            }
            .disabled(resendDisabled)
            
            NavigationLink(destination: ContinueView(), isActive: $showAlert) {
                EmptyView()
            }
            .hidden()
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text("Invalid OTP"), dismissButton: .default(Text("OK")))
        }
    }
    
    func verifyOTP() {
        // Check if OTP is correct
        if otp == "123456" {
            showAlert = true
        } else {
            showAlert = false
        }
    }
}

#Preview {
    EnterOTPView(mobileNumber: "+918651806413")
}
