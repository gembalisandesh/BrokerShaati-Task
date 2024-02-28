import Foundation

class OTPVerificationController {
    static let shared = OTPVerificationController()
    
    private init() {}
    
    func validateOTP(_ otp: String) -> Bool {
        return otp == "123456" 
    }
}
