import SwiftUI


@main
struct HeartFlicksApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView {
                MainScreen()
            }
        }
    }
}
