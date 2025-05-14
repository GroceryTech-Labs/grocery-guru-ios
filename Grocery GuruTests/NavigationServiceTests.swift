import XCTest
@testable import Grocery_Guru

class NavigationServiceTests: XCTestCase {
    var navigationService: NavigationService!

    override func setUp() {
        super.setUp()
        navigationService = NavigationService()
    }

    override func tearDown() {
        navigationService = nil
        super.tearDown()
    }

    func testPush() {
        let destination = NavigationDestination.invoiceList(items: [])
        navigationService.push(destination)
        XCTAssertEqual(navigationService.path.last, destination)
    }

    func testSheet() {
        let destination = NavigationDestination.invoiceList(items: [])
        navigationService.sheet(destination)
        XCTAssertEqual(navigationService.sheet, destination)
    }

    func testDrop() {
        let destination = NavigationDestination.invoiceList(items: [])
        navigationService.push(destination)
        navigationService.drop()
        XCTAssertTrue(navigationService.path.isEmpty)
    }

    func testDropUntil() {
        let destination1 = NavigationDestination.invoiceList(items: [])
        let destination2 = NavigationDestination.addInvoice(option: .manual)
        navigationService.push(destination1)
        navigationService.push(destination2)
        navigationService.dropUntil(destination1)
        XCTAssertEqual(navigationService.path, [destination1])
    }

    func testDropToRoot() {
        let destination = NavigationDestination.invoiceList(items: [])
        navigationService.push(destination)
        navigationService.dropToRoot()
        XCTAssertTrue(navigationService.path.isEmpty)
    }
}
