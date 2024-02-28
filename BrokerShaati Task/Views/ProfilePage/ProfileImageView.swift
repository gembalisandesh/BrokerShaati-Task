import SwiftUI
struct ProfileImageView: View {
    @Binding var profileImage: Image?
    @Binding var isShowingImagePicker: Bool
    @State private var isEditingImage = false 

    var body: some View {
        VStack {
            if let profileImage = profileImage {
                profileImage
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
            }
            
            Button(action: {
                self.isEditingImage = true
                self.isShowingImagePicker.toggle()
            }) {
                Text("Edit")
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.black.opacity(0.7))
                    .clipShape(Rectangle())
            }
        }
        .sheet(isPresented: $isShowingImagePicker) {
            if isEditingImage {
                ImagePicker(image: $profileImage)
            } else {
                
                EmptyView()
            }
        }
    }
}


