import SwiftUI

struct BannerView: View {
    @State private var currentPage = 0
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Image("Image5")
                .resizable()
                .frame(height: 100)
                .scaledToFit()
            
            TabView(selection: $currentPage) {
                ForEach(1..<4, id: \.self) { index in
                    Image("image\(index)")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 400)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(height: 400)
            .padding()
            .onReceive(timer) { _ in
                withAnimation {
                    currentPage = (currentPage + 1) % 4
                }
            }
            .gesture(DragGesture().onEnded({ (value) in
                if value.translation.width < 0 {
                    withAnimation {
                        currentPage = min(currentPage + 1, 3)
                    }
                } else if value.translation.width > 0 {
                    
                    withAnimation {
                        currentPage = max(currentPage - 1, 0)
                    }
                }
            }))
        }
    }
}

#Preview {
    BannerView()
}
