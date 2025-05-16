import SwiftUI
import SwiftData

public struct AnimatableLabelPicker<Element: Equatable, Label: View>: View {
    @Binding private var selectedElement: Element
    private var elements: [Element]

    @ViewBuilder private var label: (Element) -> Label

    public var body: some View {
        HStack(spacing: Constants.Padding.sizeS) {
            ScrollView(.horizontal) {
                ScrollViewReader { sReader in
                    HStack(spacing: 0) {
                        ForEach(Array(elements.enumerated()), id: \.offset) { item in
                            Button {
                                withAnimation(.smooth) {
                                    selectedElement = item.element
                                    sReader.scrollTo(
                                        item.offset,
                                        anchor: .leading
                                    )
                                }
                            } label: {
                                ResponsiveCard(background: background(item.element)) {
                                    label(item.element)
                                }
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .scrollClipDisabled(true)
        }
    }

    public init(
        selectedElement: Binding<Element>,
        elements: [Element],
        label: @escaping (Element) -> Label
    ) {
        self._selectedElement = selectedElement
        self.elements = elements
        self.label = label
    }

    private func background(_ element: Element) -> Color {
        switch element {
        case selectedElement:
            Color.accentColor
        default:
            Color(.secondarySystemBackground)
        }
    }
}
