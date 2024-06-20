import Foundation
import Swinject

class AppContainer {
    static private let container = Container()
    
    static func setup() {
        container.register(WeekStoreVM.self) { r in
            WeekStoreVM()
        }
        container.register(MainScreenVM.self) { r in
            MainScreenVM()
        }
        
    }
    
    static func resolve<T>(_ serviceType: T.Type) -> T {
           return container.resolve(serviceType)!
       }
    
}
