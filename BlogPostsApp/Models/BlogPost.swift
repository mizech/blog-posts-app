import Foundation
import SwiftData

@Model
class BlogPost {
    let id = UUID()
    var title: String
    var content: String
    let dateTime: Date
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
        self.dateTime = Date.now
    }
}
