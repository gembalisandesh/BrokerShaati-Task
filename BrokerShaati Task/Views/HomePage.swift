import SwiftUI

struct HomePageView: View {
    let profileImage: Image?
    let name: String
    let address: String

    var body: some View {
  
            
        VStack {
       

            HStack {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                }
                Text(name)
                .font(.headline)
                
                Text(address)
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.top, 5)
                            Spacer()
               
                
              
            }
            
            Image("HomepageImage")
                .resizable()
                .frame(width: 420, height: 750)
        }
        .padding()
            
            
    }
}
#Preview{
    HomePageView(profileImage: Image("homepagedown"), name: "sandesh", address: "chennai")
}
