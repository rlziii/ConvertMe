import Foundation

extension Numeric {
    /// A `String` currency representation.
    var currencyString: String {
        guard let number = self as? NSNumber else {
            return ""
        }

        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current

        return formatter.string(from: number) ?? ""
    }
}
