import WatchKit
import SwiftUI

class HostingController: WKHostingController<CurrencyList> {
    override var body: CurrencyList {
        return CurrencyList(with: CurrencyListModel())
    }
}
