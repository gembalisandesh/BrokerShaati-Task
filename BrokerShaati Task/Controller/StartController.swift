import Foundation

class StartController {
    
    static let shared = StartController()
    
    private init() {}
    
  
    func validatePhoneNumber(_ phoneNumber: String) -> Bool {
        return phoneNumber.count == 10
    }
}
