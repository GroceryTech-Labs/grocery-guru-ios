import Foundation

@MainActor
final class AppConfig {
    static var shared = AppConfig()

    var usedLocalRepository: LocalStorageItemRepository {
        let testMode = ProcessInfo.processInfo.arguments.contains("testMode")

        if testMode {
            return MockLocalStorageItemRepository.mockInstance
        }

        return LocalStorageItemRepository.shared
    }
}
