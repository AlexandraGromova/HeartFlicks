import Foundation
import SwiftUI

class MainScreenVM : ObservableObject {
    
    @Published var filteredNotices: [Notice]?
    
    @Published var storedNotices: [Notice] = [
        Notice(noticeTitle: "hjihbkn", noticeDate: .init(timeIntervalSince1970: 1721928863)),
        Notice(noticeTitle: "tttttbkn", noticeDate: .init(timeIntervalSince1970: 1721928863))
    ]
    
    init(){
        filterTodayNotices()
    }
    
    func getMonth() -> String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        let nameOfMonth = dateFormatter.string(from: now)
        return nameOfMonth
    }
    
    func filterTodayNotices() {
        DispatchQueue.global(qos: .userInteractive).async {
            let calendar = Calendar.current
            
            let filtered = self.storedNotices.filter{
                return calendar.isDate ($0.noticeDate, inSameDayAs: Date())
            }
            DispatchQueue.main.async {
                withAnimation {
                    self.filteredNotices = filtered
                }
            }
        }
    }
    
}
