import Foundation

struct Notice: Identifiable {
    var id = UUID().uuidString
    var noticeTitle: String
    var noticeDate: Date
}
