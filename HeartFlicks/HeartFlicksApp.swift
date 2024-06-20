import SwiftUI

@main
struct HeartFlicksApp: App {
    
    init() { AppContainer.setup()}
    
    var body: some Scene {
        WindowGroup {
            RouterView {
                MainScreen()
            }
        }
    }
}
