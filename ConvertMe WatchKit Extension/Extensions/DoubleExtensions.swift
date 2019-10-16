import Foundation

extension Double {
    /// A `String` representation rounded to two digits after the decimal.
    var stringRoundedToTwoPlaces: String {
        return String(format: "%.2f", self)
    }

    /// A `String` representation rounded to four digits after the decimal.
    var stringRoundedToFourPlaces: String {
        return String(format: "%.4f", self)
    }
}
