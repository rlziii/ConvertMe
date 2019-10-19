import Foundation

extension Numeric {
    /// A `String` currency representation using the supplied locale.
    /// - Parameter locale: The locale of the desired converted currency output.
    func currencyString(for locale: Locale) -> String {
        guard let number = self as? NSNumber else {
            return ""
        }

        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = locale

        return formatter.string(from: number) ?? ""
    }
}
