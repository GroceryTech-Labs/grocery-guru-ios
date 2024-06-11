import XCTest

final class AccessibilityAuditTests: XCTestCase {
    enum TypeOfHandle: String, CaseIterable {
        case okay = "OK"
        case select = "Select"
        case allowPhotos = "Allow Access to All Photos"
        case decline = "Don’t Allow"
    }

    func testHomeAudit() throws {
        let app = XCUIApplication()

        // Set app to test mode
        app.launchArguments = ["testMode"]
        app.launch()

        try app.performAccessibilityAudit { issue in
            switch issue.auditType {
            case .sufficientElementDescription: false
            case .trait: false
            case .elementDetection: false
            case .hitRegion: false
            default: true
            }
        }

        app.terminate()
    }

    func buildSystemAlertsHandler(type: TypeOfHandle) -> NSObjectProtocol {
        addUIInterruptionMonitor(withDescription: "System alert") { alert in
            let actionButton = alert.buttons[type.rawValue]

            guard actionButton.exists else {
                return false
            }

            actionButton.tap()
            return true
        }
    }

    override func addUIInterruptionMonitor(
        withDescription handlerDescription: String,
        handler: @escaping (XCUIElement) -> Bool
    ) -> any NSObjectProtocol {
        buildSystemAlertsHandler(type: .okay)
    }
}
