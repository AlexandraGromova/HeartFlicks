import SwiftUI

struct MainScreen: View {
    @EnvironmentObject var router: Router
    @StateObject var vm = AppContainer.resolve(MainScreenVM.self)
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                HStack() {
                    Spacer()
                    Text("\(vm.getMonth())")
                        .font(.system(size: 25))
                        .foregroundStyle(.royalBlue)
                        .padding(.horizontal, 10)
                    Button {
                        router.navigateTo(Router.Route.calendarScreen)
                    } label: {
                        Image(systemName: "calendar")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 25)
                            .padding(.trailing, 25)
                            .foregroundStyle(.royalBlue)
                    }
                }
                .padding(.bottom, 15)
                
                WeekCalendar()
                DayCard()
            }
            .background(.lightPink)
            Spacer()
            LoveAdvice()
            Spacer()
            HStack() {
                AddLoveAction(person: .user)
                Spacer()
                AddLoveAction(person: .partner)
            }
            .padding(.bottom, 40)
            
        }
        .background(.lightYellow)
    }
}

struct LoveAdvice: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Articles about relationship:")
                .font(.system(size: 17).bold())
                .foregroundStyle(.royalBlue)
                .padding(.top, 20)
                .padding(.leading, 15)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack() {
                    ForEach(0..<6) {_ in
                        ZStack(){
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.lightPink)
                                .frame(width: 100, height: 120)
                                .padding(.horizontal, 1)
                            Text("okj")
                                .frame(alignment: .leading)
                            
                        }
                    }
                }
            }
        }
    }
}

struct AddLoveAction: View {
    var person: Person
    var body: some View {
        let fillColor = person == .user ? Color.lightBlue : Color.lightPink
        let text = person == .user ? "For me": "For my partner"
        ZStack() {
            RoundedRectangle(cornerRadius: 25)
                .fill(fillColor)
                .frame(width: 100, height: 100)
            VStack() {
                Spacer()
                Text(text)
                    .frame(alignment: .center)
                    .font(.system(size: 17).bold())
                    .foregroundStyle(.royalBlue)
                Spacer()
                Image(systemName: "arrow.down.heart.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 25)
                    .foregroundStyle(.fluorescentPink)
                Spacer()
            }
        }
        .frame(width: 100, height: 100)
        .padding(.horizontal, 40)
    }
}

struct DayCard: View {
    var body: some View {
        HStack() {
            Spacer()
            VStack(alignment: .center) {
                Text("No planned cute activities")
                    .font(.system(size: 30).bold())
                    .foregroundStyle(.royalBlue)
                    .multilineTextAlignment(.center)
                    .padding(.top, 40)
                    .padding(.horizontal, 60)
                Button("Rounded Button") {
                    
                }
                .font(.system(size: 15))
                .padding(10)
                .foregroundColor(.white)
                .background(.royalBlue)
                .clipShape(Capsule())
                .padding(.top, 15)
                Text("👇 Perhaps these articles will help you 👇")
                    .font(.system(size: 15))
                    .foregroundStyle(.royalBlue)
                    .padding(.top, 20)
            }
            Spacer()
        }
    }
}

enum Person {
    case user
    case partner
}

#Preview {
    MainScreen()
}
