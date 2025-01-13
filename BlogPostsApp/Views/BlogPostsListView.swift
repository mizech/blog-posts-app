import SwiftData
import SwiftUI

struct BlogPostsListView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \BlogPost.dateTime) private var blogPosts: [BlogPost]
    
    @State private var isAddSheetShown = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(blogPosts) { blogPost in
                        NavigationLink {
                            BlogPostDetailsView(blogPost: blogPost)
                        } label: {
                            VStack {
                                Text(blogPost.title)
                                    .font(.title)
                                Text(blogPost.content)
                                    .lineLimit(2)
                            }
                        }
                    }.onDelete { indexSet in
                        for i in indexSet {
                            context.delete(blogPosts[i])
                        }
                    }
                }.listStyle(.plain)
            }.toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add", systemImage: "plus") {
                        isAddSheetShown.toggle()
                    }
                }
            }.sheet(isPresented: $isAddSheetShown) {
                BlogPostFormView(isAddSheetShown: $isAddSheetShown)
            }
        }
    }
}

#Preview {
    BlogPostsListView()
}
