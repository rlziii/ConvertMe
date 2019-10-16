import SwiftUI

extension Text {
    /// Initializes a `Text` view given a `Character` as the content.
    /// 
    /// - Parameter character: The `Character` to be converted to a `String` and set as the content.
    init(_ character: Character) {
        self.init(String(character))
    }
}
