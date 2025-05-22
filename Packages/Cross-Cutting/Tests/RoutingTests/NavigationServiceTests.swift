import Testing
@testable import Routing

@Suite("Product tests") struct NavigationServiceTests {
    var navigationService: NavigationService

    init(navigationService: NavigationService = NavigationService()) {
        self.navigationService = navigationService
    }

    @Test func pushDestination() {
        let destination = NavigationDestination.invoiceList
        navigationService.push(destination)
        #expect(navigationService.path.last == destination)
    }

    @Test func presentSheet() {
        let destination = NavigationDestination.invoiceList
        navigationService.sheet(destination)
        #expect(navigationService.sheet == destination)
    }

    @Test func dropDestination() {
        let destination = NavigationDestination.invoiceList
        navigationService.push(destination)
        navigationService.drop()
        #expect(navigationService.path.isEmpty)
    }

    @Test func dropUntilDestination() {
        let destination1 = NavigationDestination.invoiceList
        let destination2 = NavigationDestination.addInvoice
        navigationService.push(destination1)
        navigationService.push(destination2)
        navigationService.dropUntil(destination1)
        #expect(navigationService.path == [destination1])
    }

    @Test func dropToRoot() {
        let destination = NavigationDestination.invoiceList
        navigationService.push(destination)
        navigationService.dropToRoot()
        #expect(navigationService.path.isEmpty)
    }
}
