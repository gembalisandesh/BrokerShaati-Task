import SwiftUI

struct SplashScreen: View {
    @State private var showMainContent = false
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            Image("SplashScreen")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .onAppear {
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        withAnimation {
                            showMainContent = true
                        }
                    }
                }
        }
        .fullScreenCover(isPresented: $showMainContent) {
            ContentView()
        }
    }
}



#Preview {
    SplashScreen()
}
