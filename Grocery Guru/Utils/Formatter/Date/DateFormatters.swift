import Foundation

extension DateFormatter {
    static var fullDateStyleFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }
}
