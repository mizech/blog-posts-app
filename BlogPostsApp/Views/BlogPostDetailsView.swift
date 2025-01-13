import SwiftUI

struct BlogPostDetailsView: View {
    @State var isAddSheetShown = false
    
    var blogPost: BlogPost
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(blogPost.title)
                .font(.title)
            Text(blogPost.dateTime.formatted(date: .complete, time: .shortened))
                .font(.subheadline)
            Text(blogPost.content)
            Spacer()
        }.padding()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Edit", systemImage: "pencil.circle") {
                        isAddSheetShown.toggle()
                    }
                }
            }.sheet(isPresented: $isAddSheetShown) {
                BlogPostFormView(isAddSheetShown: $isAddSheetShown, blogPost: blogPost)
            }
    }
}

#Preview {
    BlogPostDetailsView(
        isAddSheetShown: false,
        blogPost: BlogPost(
            title: "Title 001",
            content: "Content of the Blog-Post ..."
        )
    )
}
