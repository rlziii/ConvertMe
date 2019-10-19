import Foundation

/// A model representing a type of currency (i.e. USD).
struct CurrencyModel: Identifiable {

    // MARK: Instance Properties

    /// A unique, stable identifier.
    var id: String {
        code
    }

    /// The three-character ISO 4217 alphabetic code (i.e. currency designation).
    let code: String

    /// The locale of the currency.
    let locale: Locale

    /// The common name of the currency.
    let name: String

    /// The flag Unicode character that represents the primary country of use.
    let flag: Character

    /// The conversion rate from USD (i.e. the equivalent of USD $1.00).
    let rate: Double
}
