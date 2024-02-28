import SwiftUI

struct ProfileScreen: View {
    @StateObject private var profileController = ProfileController(profile: Profile(name: "", age: "", gender: "", imaNumber: "", hospitalClinicName: "", experience: "", completeAddress: "", email: "", password: "", confirmPassword: "", profileImage: nil))
    @State private var isShowingImagePicker = false
    @State private var showingHomePage = false
    @State private var showAlert = false // State to control showing the alert

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Let us know you better")
                    .font(.title)
                
                ProfileFormView(profileController: profileController, isShowingImagePicker: $isShowingImagePicker)
                
                Button(action: {
                   
                    if profileController.profile.profileImage != nil &&
                       !profileController.profile.name.isEmpty &&
                       !profileController.profile.completeAddress.isEmpty &&
                       !profileController.profile.password.isEmpty &&
                       !profileController.profile.confirmPassword.isEmpty {
                        showingHomePage = true //
                    } else {
                        showAlert = true
                    }
                }) {
                    Text("Let's Get Started")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
            .padding()
            .sheet(isPresented: $isShowingImagePicker) {
                ImagePicker(image: $profileController.profile.profileImage)
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Incomplete Details"), message: Text("Please complete all details before proceeding."), dismissButton: .default(Text("OK")))
            }
        }
        .background(
            NavigationLink(destination: HomePageView(profileImage: profileController.profile.profileImage, name: profileController.profile.name, address: profileController.profile.completeAddress), isActive: $showingHomePage) {
                EmptyView()
            }
        )
    }
}

#Preview {
    ProfileScreen()
}
