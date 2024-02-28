import SwiftUI

class ProfileController: ObservableObject {
    @Published var profile: Profile

    init(profile: Profile) {
        self.profile = profile
    }
}
