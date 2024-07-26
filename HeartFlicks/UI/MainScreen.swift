import SwiftUI

struct MainScreen: View {
    @EnvironmentObject var router: Router
    @StateObject var vm = AppContainer.resolve(MainScreenVM.self)
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: 0)
                TopView(month: "\(vm.getMonth())") {
                    router.navigateTo(Router.Route.calendarScreen)
                }
                .padding(.bottom, 15)
                WeekCalendar(currentWeek: vm.currentWeek, currentDay: $vm.currentDay)
                Spacer()
                    .frame(height: 10)
                if let notices = vm.filteredNotices {
                    DayCard(mainText: "No planned \ncute activities", notices: notices, isScrollDisabled: notices.count>3 ? false : true)
                        .onChange(of: vm.currentDay) { newValue in
                            vm.filterTodayNotices()
                        }
                } else {
                    Text("none")
                }
                Spacer()
            }
            .frame(height: UIScreen.main.bounds.height/2 - 20)
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

struct TopView: View {
    let month: String
    let tapCalendar: () -> ()
    var body: some View {
        HStack(spacing: 0) {
            Spacer()
            Text(month)
                .font(.system(size: 25))
                .foregroundStyle(.royalBlue)
                .padding(.horizontal, 10)
            Button {
                tapCalendar()
            } label: {
                Image(systemName: "calendar")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 25)
                    .padding(.trailing, 25)
                    .foregroundStyle(.royalBlue)
            }
        }
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
                            Text("")
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
struct NoticeCard: View {
    var date: Date?
    var title: String
    var body: some View {
        HStack() {
            Text(title)
                .font(.system(size: 20).bold())
                .foregroundStyle(.royalBlue)
                .padding(.horizontal, 10)
            Divider()
                .frame(height: 25)
                .foregroundStyle(.royalBlue)
            Text("19:00")
                .font(.system(size: 20).bold())
                .foregroundStyle(.royalBlue)
                .padding(.horizontal, 10)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(.lightBlue)
        .cornerRadius(15)
    }
}


struct DayCard: View {
    var mainText : String
    var notices : [Notice]
    var isScrollDisabled : Bool
    
    var body: some View {
        HStack() {
            Spacer()
            VStack(alignment: .center) {
                ScrollView() {
                    LazyVStack() {
                        if notices.isEmpty {
                            Text (mainText)
                                .font(.system(size: 30).bold())
                                .foregroundStyle(.royalBlue)
                                .multilineTextAlignment(.center)
                        } else {
                            ForEach(notices) { notice in
                                NoticeCard( title: notice.noticeTitle)
                            }
                        }
                    }
                    .frame(minHeight: 140)
                }
                .scrollDisabled(isScrollDisabled)
                .scrollIndicators(ScrollIndicatorVisibility.never)
                Button("Add activities") {
                    
                }
                .font(.system(size: 15))
                .padding(10)
                .foregroundColor(.white)
                .background(.royalBlue)
                .clipShape(Capsule())
                .padding(.bottom, 15)
                Text("👇 Perhaps these articles will help you 👇")
                    .font(.system(size: 15))
                    .foregroundStyle(.royalBlue)
                    .padding(.bottom, 20)
            }
            Spacer()
        }
    }
}

enum Person {
    case user
    case partner
}
