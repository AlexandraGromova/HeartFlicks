import SwiftUI

struct MainScreen: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack() {
            HStack() {
                Spacer()
                Text("June")
                    .font(.system(size: 25))
                    .padding(.horizontal, 5)
                Button {
                    router.navigateTo(Router.Route.calendarScreen)
                } label: {
                    Image(systemName: "calendar")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 25)
                        .padding(.trailing, 25)
                }
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
