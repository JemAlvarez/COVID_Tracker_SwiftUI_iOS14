//

import Foundation

extension Date {
    func relativeTimeFormat() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
    
    func format(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

extension String {
    func isoToDate() -> Date {
        let isoDate = self
        let dateFormatter = ISO8601DateFormatter()
        return dateFormatter.date(from:isoDate) ?? Date()
    }
}
