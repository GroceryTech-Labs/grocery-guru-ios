import XCTest
@testable import Grocery_Guru

class LocalItemRepositoryTests: XCTestCase {
    var repository: LocalStorageItemRepository!

    @MainActor
    override func setUp() {
        super.setUp()
        repository = MockLocalStorageItemRepository()
    }

    override func tearDown() {
        repository = nil
        super.tearDown()
    }

    @MainActor func testGetAllItems() async {
        // Given
        let item1 = InvoiceItem(name: "Cheese", amount: 200, category: .milkEgg)
        let item2 = InvoiceItem(name: "Rumpsteak", amount: 400, category: .meat)
        do {
            try repository.addItem(item1)
            try repository.addItem(item2)
        } catch {
            XCTAssert(false)
        }

        // When
        let items: [InvoiceItem]

        do {
            items = try await repository.fetchAllItems()
        } catch {
            items = []
        }

        // Then
        XCTAssertEqual(items.count, 2)
        XCTAssertEqual(items[0], item1)
        XCTAssertEqual(items[1], item2)
    }

    @MainActor func testAddItem() async {
        // Given
        let item = InvoiceItem(name: "Cheese", amount: 200, category: .milkEgg)

        // When
        do {
            try repository.addItem(item)
        } catch {
            XCTAssert(false)
        }

        // Then
        let items: [InvoiceItem]
        do {
            items = try await repository.fetchAllItems()
        } catch {
            items = []
        }

        XCTAssertEqual(items.count, 1)
        XCTAssertEqual(items[0], item)
    }

    @MainActor func testRemoveItem() async {
        // Given
        let item = InvoiceItem(name: "Cheese", amount: 200, category: .milkEgg)
        let item2 = InvoiceItem(name: "Bread", amount: 1, category: .bakery)

        // When
        do {
            try repository.addItem(item)
            try repository.addItem(item2)
        } catch {
            XCTAssert(false)
        }

        var items: [InvoiceItem]

        do {
            items = try await repository.fetchAllItems()
        } catch {
            items = []
        }

        XCTAssertEqual(items.count, 2)

        // Then
        repository.deleteItem(item)

        do {
            items = try await repository.fetchAllItems()
        } catch {
            items = []
        }

        XCTAssertEqual(items.count, 1)
    }

    @MainActor func testRemoveWrongItem() async {
        // Given
        let item = InvoiceItem(name: "Cheese", amount: 200, category: .milkEgg)
        let item2 = InvoiceItem(name: "Bread", amount: 1, category: .bakery)

        // When
        do {
            try repository.addItem(item)
        } catch {
            XCTAssert(false)
        }

        var items: [InvoiceItem]

        do {
            items = try await repository.fetchAllItems()
        } catch {
            items = []
        }

        XCTAssertEqual(items.count, 1)

        // Then
        repository.deleteItem(item2)

        do {
            items = try await repository.fetchAllItems()
        } catch {
            items = []
        }

        XCTAssertEqual(items.count, 1)
    }
}
