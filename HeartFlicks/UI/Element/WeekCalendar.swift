import SwiftUI

struct WeekCalendar: View {
    @StateObject var weekStore = AppContainer.resolve(WeekStoreController.self)
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(weekStore.currentWeek, id: \.self) { day in
                    Text(day.formatted(date: .abbreviated, time: .omitted))
                }
            }
        }
    }
}


#Preview {
    WeekCalendar()
}
