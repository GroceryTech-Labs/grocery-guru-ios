import SwiftUI
import SwiftData
import DesignSystem

public struct CategoryPicker: View {
    @Binding var selectedElement: BaseCategory

    @Query var customCategories: [CustomCategory]

    private var categories: [BaseCategory] {
        BaseCategory.allCases + customCategories.map { category in
            BaseCategory.custom(
                name: category.name,
                emoji: category.emoji
            )
        }
    }

    public var body: some View {
        AnimatableLabelPicker(
            selectedElement: $selectedElement,
            elements: categories
        ) { category in
            CategoryPickerLabel(
                selectedCategory: selectedElement,
                category: category
            )
        }
    }

    public init(selectedElement: Binding<BaseCategory>) {
        self._selectedElement = selectedElement
    }
}

#Preview {
    @Previewable @State var selectedElement = BaseCategory.bakery
    CategoryPicker(
        selectedElement: $selectedElement,
    )
}
