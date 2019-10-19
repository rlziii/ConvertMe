import Foundation

/// A model representing a list of currency options.
class CurrencyListModel: ObservableObject {

    // MARK: Data Properties

    /// The currencies available from which to convert.
    ///
    /// - Note: Rates retrieved from MSN Money on 2019-10-15T00:57:32Z.
    @Published var currencies: [CurrencyModel] = [
        CurrencyModel(code: "EUR", locale: Locale(identifier: "en_EU"), name: "Euro", flag: "🇪🇺", rate: 0.9070),
        CurrencyModel(code: "JPY", locale: Locale(identifier: "en_JP"),  name: "Yen", flag: "🇯🇵", rate: 108.3400),
        CurrencyModel(code: "GBP", locale: Locale(identifier: "en_GB"),  name: "Pound", flag: "🇬🇧", rate: 1.2607),
        CurrencyModel(code: "CAD", locale: Locale(identifier: "en_CA"),  name: "CA Dollar", flag: "🇨🇦", rate: 1.3228),
        CurrencyModel(code: "AUD", locale: Locale(identifier: "en_AU"),  name: "AU Dollar", flag: "🇦🇺", rate: 1.4771),
        CurrencyModel(code: "CNY", locale: Locale(identifier: "en_CN"),  name: "Renminbi", flag: "🇨🇳", rate: 7.0635),
        CurrencyModel(code: "CHF", locale: Locale(identifier: "en_CH"),  name: "Franc", flag: "🇨🇭", rate: 0.9978),
        CurrencyModel(code: "HKD", locale: Locale(identifier: "en_HK"),  name: "HK Dollar", flag: "🇭🇰", rate: 7.8444),
        CurrencyModel(code: "SEK", locale: Locale(identifier: "en_SE"),  name: "Krona", flag: "🇸🇪", rate: 9.8239),
        CurrencyModel(code: "KRW", locale: Locale(identifier: "en_KR"),  name: "Won", flag: "🇰🇷", rate: 1_185.5800)
    ]

    // MARK: Instance Methods

    /// Moves an item within the `currencies` array to the specified index.
    ///
    /// - Parameter source: The set of indices to be moved.
    /// - Parameter destination: The index of the destination.
    func move(from source: IndexSet, to destination: Int) {
        guard let index = source.first else {
            return
        }

        let element = currencies.remove(at: index)
        currencies.insert(element, at: destination)
    }

    /// Removes an item from the `currencies` array at the specified index.
    ///
    /// - Parameter indices: The set of indices to be removed.
    func delete(at indices: IndexSet) {
        indices.forEach {
            currencies.remove(at: $0)
        }
    }
}
