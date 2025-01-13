import SwiftData
import SwiftUI

struct BlogPostFormView: View {
    @Environment(\.modelContext) private var context
    @Binding var isAddSheetShown: Bool
    var blogPost: BlogPost? = nil
    
    @State var currTitle = ""
    @State var currContent = ""
    
    var body: some View {
        Form {
            Section("Blog-title and content") {
                TextField("Title", text: $currTitle)
                TextField("Content", text: $currContent)
            }
            
            Section {
                Button(action: {
                    guard currTitle.isEmpty == false, currContent.isEmpty == false else {
                        return
                    }
                    
                    if blogPost == nil {
                        let blogPost = BlogPost(title: currTitle, content: currContent)
                        context.insert(blogPost)
                    } else {
                        blogPost?.title = currTitle
                        blogPost?.content = currContent
                        do {
                            try context.save()
                        } catch {
                            print(error)
                        }
                    }
                    
                    isAddSheetShown.toggle()
                }) {
                    Text("Submit")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
        }.onAppear() {
            if let blogPost = blogPost {
                currTitle = blogPost.title
                currContent = blogPost.content
            }
        }
    }
}

#Preview {
    BlogPostFormView(isAddSheetShown: .constant(true))
}
