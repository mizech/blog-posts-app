import SwiftUI

struct OnBoardingView: View {
    @Binding var isOnboarded: Bool
    
    var body: some View {
        VStack {
            Text("Blog Posts-App")
                .font(.largeTitle)
            Text("""
                Instructions:
                - Use the add-Button (+) to create new blog-posts.
                - Delete: Swipe-left on existing blog-posts.
                - Within the list: Tap a blog-post, to read the full post.
                - Within the full post-view: Tap the edit-button (pencil) in the upper-left to modify the post.
                """)
            Spacer()
            Button {
                isOnboarded.toggle()
            } label: {
                Text(" 🚀 Let's go!")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(.green)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            Spacer()
        }.padding()
    }
}

#Preview {
    OnBoardingView(isOnboarded: .constant(false))
}
