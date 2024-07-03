import Foundation

class MainScreenVM : ObservableObject {
    @Published var currentDay: String = ""
    
    
    func getMonth() -> String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        let nameOfMonth = dateFormatter.string(from: now)
        return nameOfMonth
    }
    
}
