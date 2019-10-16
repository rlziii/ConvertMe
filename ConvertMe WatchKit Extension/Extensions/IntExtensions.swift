import Foundation

extension Int {
    /// A `String` representation that always has at least two digits (with leading zeros when necessary).
    var twoDigitString: String {
        return String(format: "%02d", self)
    }
}

extension Int: Identifiable {
    public var id: Int {
        self
    }
}
