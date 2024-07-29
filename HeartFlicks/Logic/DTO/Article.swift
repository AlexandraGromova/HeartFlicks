import Foundation

struct Article: Identifiable {
    let id = UUID().uuidString
    var title: String
}
