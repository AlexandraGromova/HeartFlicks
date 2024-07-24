import SwiftUI

struct WeekCalendar: View {
    @StateObject var weekStore = AppContainer.resolve(WeekStoreController.self)
    @Namespace var animation
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(weekStore.currentWeek, id: \.self) { day in
                    VStack(spacing: 10) {
                        Text(weekStore.extractDate(date: day, format: "dd"))
                            .font(.system(size:14))
                            .fontWeight(.semibold)
                        Text(weekStore.extractDate(date: day, format: "EEE"))
                            .font(.system(size:14))
                    }
                    .foregroundStyle(weekStore.isToday(date: day) ? .primary : .tertiary)
                    .foregroundColor(weekStore.isToday(date: day) ? .white : .black)
                    .frame(width: 45, height: 80)
                    .background(
                        ZStack {
                            if weekStore.isToday(date: day) {
                                Capsule()
                                    .fill(.royalBlue)
                                    .matchedGeometryEffect(id: "CURRENTDAY", in: animation)
                            }
                        }
                    )
                    .contentShape(Capsule())
                    .onTapGesture {
                        withAnimation{
                            weekStore.currentDay = day
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}


#Preview {
    WeekCalendar()
}
