import Foundation
import SwiftData

@MainActor
public protocol CategoryRepository: Sendable {
    func fetchCategories() async throws -> [UICategoryItem]
    func addCategory(name: String, emoji: String) async throws
    func deleteCategory(_ category: UICategoryItem) async
}
