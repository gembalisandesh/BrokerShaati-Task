import SwiftUI

struct ProfileFormView: View {
    @ObservedObject var profileController: ProfileController
    @Binding var isShowingImagePicker: Bool

    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                
                TextField("Enter name here", text: $profileController.profile.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.title3)
                    .cornerRadius(10.0)
                    .frame(height: 150)
                
                ProfileImageView(profileImage: $profileController.profile.profileImage, isShowingImagePicker: $isShowingImagePicker)
            }
           
            HStack {
                TextField("Age", text: $profileController.profile.age)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 100)
                Spacer()
                Picker("Gender", selection: $profileController.profile.gender) {
                    Text("Male").tag("Male")
                    Text("Female").tag("Female")
                    Text("Other").tag("Other")
                }
                .pickerStyle(MenuPickerStyle())
            }
           
            
            TextField("IMA Number", text: $profileController.profile.imaNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Hospital/Clinic Name", text: $profileController.profile.hospitalClinicName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Experience", text: $profileController.profile.experience)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Complete Address", text: $profileController.profile.completeAddress)
                .frame(height: 100)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.gray, width: 1)
            
            TextField("Email ID e.g xyz@gmail.com", text: $profileController.profile.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Choose Password", text: $profileController.profile.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textContentType(.password) 

            SecureField("Confirm Password", text: $profileController.profile.confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textContentType(.password)

        }
    }
}


