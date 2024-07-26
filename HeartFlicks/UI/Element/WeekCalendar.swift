import SwiftUI

struct WeekCalendar: View {
    @Namespace var animation
    var currentWeek: [Date]
    @Binding var currentDay: Date 
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(currentWeek, id: \.self) { day in
                    VStack(spacing: 10) {
                        Text(extractDate(date: day, format: "dd"))
                            .font(.system(size:14))
                            .fontWeight(.semibold)
                        Text(extractDate(date: day, format: "EEE"))
                            .font(.system(size:14))
                    }
                    .foregroundStyle(isToday(date: day) ? .primary : .tertiary)
                    .foregroundColor(isToday(date: day) ? .white : .black)
                    .frame(width: 45, height: 80)
                    .background(
                        ZStack {
                            if isToday(date: day) {
                                Capsule()
                                    .fill(.royalBlue)
                                    .matchedGeometryEffect(id: "CURRENTDAY", in: animation)
                            }
                        }
                    )
                    .contentShape(Capsule())
                    .onTapGesture {
                        withAnimation{
                            currentDay = day
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    func extractDate (date: Date, format: String) -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    func isToday(date: Date)-> Bool {
        let calendar = Calendar.current
        return calendar.isDate(currentDay, inSameDayAs: date)
    }
}
