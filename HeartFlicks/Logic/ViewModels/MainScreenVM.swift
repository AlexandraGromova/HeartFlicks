import Foundation
import SwiftUI

class MainScreenVM : ObservableObject {
    
    @Published var filteredNotices: [Notice]?
    @Published var currentWeek : [Date] = []
    @Published var currentDay = Date()
    @Published var storedNotices: [Notice] = [
        Notice(noticeTitle: "hjihbkn", noticeDate: .init(timeIntervalSince1970: 1721928863)),
        Notice(noticeTitle: "yuyiu", noticeDate: .init(timeIntervalSince1970: 1721928863)),
        Notice(noticeTitle: "yuyiu", noticeDate: .init(timeIntervalSince1970: 1721928863)),
        Notice(noticeTitle: "yuyiu", noticeDate: .init(timeIntervalSince1970: 1721928863)),
        Notice(noticeTitle: "tttlkjlkjnlknttbkn", noticeDate: .init(timeIntervalSince1970: 1721902593)),
        Notice(noticeTitle: "tgvgttttbkn", noticeDate: .init(timeIntervalSince1970: 1721936593)),
        Notice(noticeTitle: "tgkn", noticeDate: .init(timeIntervalSince1970: 1721763955)),
        Notice(noticeTitle: "tgkn", noticeDate: .init(timeIntervalSince1970: 1721763955)),
        Notice(noticeTitle: "tgkn", noticeDate: .init(timeIntervalSince1970: 1721763955)),
    ]
    
    init() {
        fetchCurrentWeek()
        filterTodayNotices()
    }
    
    func getMonth() -> String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        let nameOfMonth = dateFormatter.string(from: now)
        return nameOfMonth
    }
    
    func fetchCurrentWeek() {
        let today = Date()
        let calendar = Calendar.current
        
        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstWeekDay = week?.start else {
            return }
        (1...7).forEach { day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: firstWeekDay) {
                currentWeek.append(weekday)
            }
        }
    }
    
//    func extractDate (date: Date, format: String) -> String {
//        let formatter = DateFormatter()
//        
//        formatter.dateFormat = format
//        return formatter.string(from: date)
//    }
    
//    func isToday(date: Date)-> Bool {
//        let calendar = Calendar.current
//        return calendar.isDate(currentDay, inSameDayAs: date)
//    }
    
    func filterTodayNotices() {
        DispatchQueue.global(qos: .userInteractive).async {
            let calendar = Calendar.current
            
            let filtered = self.storedNotices.filter{
                return calendar.isDate ($0.noticeDate, inSameDayAs: self.currentDay)
            }
            DispatchQueue.main.async {
                withAnimation {
                    self.filteredNotices = filtered
                }
            }
        }
    }
    
}
