import SwiftData
import SwiftUI

struct ContentView: View {
    @AppStorage("isOnboarded") var isOnboarded: Bool = false
    
    var body: some View {
        if isOnboarded == false {
            OnBoardingView(isOnboarded: $isOnboarded)
        } else {
            BlogPostsListView()
        }
    }
}

#Preview {
    ContentView()
}
