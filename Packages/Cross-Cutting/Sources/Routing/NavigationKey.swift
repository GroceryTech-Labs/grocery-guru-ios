import SwiftUI

public struct NavigationKey: @preconcurrency EnvironmentKey {
    @MainActor public static var defaultValue: NavigationService = .shared
}

extension EnvironmentValues {
    public var navigationService: NavigationService {
        get { self[NavigationKey.self] }
        set { self[NavigationKey.self] = newValue }
    }
}
