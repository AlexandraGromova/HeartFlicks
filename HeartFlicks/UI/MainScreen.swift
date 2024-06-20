import SwiftUI

struct MainScreen: View {
    @EnvironmentObject var router: Router
    @StateObject var vm = AppContainer.resolve(MainScreenVM.self)
    
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
            VStack {
                WeekCalendar()
                    .background(Color.blue)
                DayCard()
                Spacer()
                LoveAdvice()
                Spacer()
                HStack() {
                    AddLoveAction()
                    Spacer()
                    AddLoveAction()
                }
            }
            Spacer()
        }
    }
}

struct LoveAdvice: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack() {
                ForEach(0..<6) {_ in 
                    ZStack(){
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.cyan)
                            .frame(width: 100, height: 120)
                            .padding(.horizontal, 1)
                        Text("hbgiuuj")
                    }
                }
            }
        }
    }
}

struct AddLoveAction: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.yellow)
            .frame(width: 100, height: 100)
            .padding(.horizontal, 40)
    }
}

struct DayCard: View {
    var body: some View {
        HStack() {
            Spacer()
            VStack(alignment: .center) {
                Text("day")
            }
            Spacer()
        }
        .frame(height: 200)
        .background(Color.red)
    }
}



#Preview {
    MainScreen()
}
