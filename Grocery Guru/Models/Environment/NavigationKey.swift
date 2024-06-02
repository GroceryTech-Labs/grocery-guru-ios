import SwiftUI

struct NavigationKey: EnvironmentKey {
    static var defaultValue: NavigationService = .shared
}

extension EnvironmentValues {
    var navigationService: NavigationService {
        get { self[NavigationKey.self] }
        set { self[NavigationKey.self] = newValue }
    }
}
