import SwiftUI

struct MainScreen: View {
    var body: some View {
        VStack() {
            HStack() {
                Spacer()
                Text("June")
                    .font(.system(size: 25))
                    .padding(.horizontal, 5)
                Image(systemName: "calendar")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 25)
                    .padding(.trailing, 25)
            }
            HStack{
                WeekCalendar()
            }
            Spacer()
        }
    }
}



#Preview {
    MainScreen()
}
