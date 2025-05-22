import Foundation
import SwiftData

public protocol CategoryRepository: ModelActor, Sendable {
    func fetchCategories() async throws -> [UICategoryItem]
    func addCategory(name: String, emoji: String) throws
    func deleteCategory(_ category: UICategoryItem)
}
