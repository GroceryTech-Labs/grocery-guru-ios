import XCTest
@testable import Grocery_Guru

class MockItemRepositoryTests: XCTestCase {
    var repository: MockItemRepository!

    override func setUp() {
        super.setUp()
        repository = MockItemRepository()
    }

    override func tearDown() {
        repository = nil
        super.tearDown()
    }

    func testGetAllItems() {
        // Given
        let item1 = InvoiceItem(name: "Cheese", amount: 200, category: .milkEgg)
        let item2 = InvoiceItem(name: "Rumpsteak", amount: 400, category: .meat)
        repository.addItem(item1)
        repository.addItem(item2)

        // When
        let items = repository.fetchAllItems()

        // Then
        XCTAssertEqual(items.count, 2)
        XCTAssertEqual(items[0], item1)
        XCTAssertEqual(items[1], item2)
    }

    func testAddItem() {
        // Given
        let item = InvoiceItem(name: "Cheese", amount: 200, category: .milkEgg)

        // When
        repository.addItem(item)

        // Then
        let items = repository.fetchAllItems()
        XCTAssertEqual(items.count, 1)
        XCTAssertEqual(items[0], item)
    }

    func testRemoveItem() {
        // Given
        let item = InvoiceItem(name: "Cheese", amount: 200, category: .milkEgg)

        // When
        repository.addItem(item)
        var items = repository.fetchAllItems()
        XCTAssertEqual(items.count, 1)

        // Then
        repository.deleteItem(item)
        items = repository.fetchAllItems()
        XCTAssertEqual(items.count, 0)
    }

    func testRemoveWrongItem() {
        // Given
        let item = InvoiceItem(name: "Cheese", amount: 200, category: .milkEgg)
        let item2 = InvoiceItem(name: "Bread", amount: 1, category: .bakery)

        // When
        repository.addItem(item)
        var items = repository.fetchAllItems()
        XCTAssertEqual(items.count, 1)

        // Then
        repository.deleteItem(item2)
        items = repository.fetchAllItems()
        XCTAssertEqual(items.count, 1)
    }
}
