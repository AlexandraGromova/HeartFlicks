import ElegantCalendar
import SwiftUI

struct CalendarScreen: View {

      @ObservedObject var calendarManager = ElegantCalendarManager(
          configuration: CalendarConfiguration(startDate: Date().addingTimeInterval(TimeInterval(60 * 60 * 24 * (-30 * 36))),
                                               endDate: Date().addingTimeInterval(TimeInterval(60 * 60 * 24 * (30 * 36)))))
    
    var body: some View {
        ElegantCalendarView(calendarManager: calendarManager)
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CalendarScreen()
}
