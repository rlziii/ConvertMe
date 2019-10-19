import SwiftUI

// MARK: - View

/// A view representing a currency converter (from USD to a specified currency).
struct CurrencyView: View {
    
    // MARK: Data Properties

    @State private var integralPart = 0
    @State private var fractionalPart = 0

    // MARK: Instance Properties

    private let model: CurrencyModel

    private var conversion: Double {
        let leading = Double(integralPart)
        let trailing = Double(fractionalPart) / 100

        return (leading + trailing) * model.rate
    }

    // MARK: Body

    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                Text("$").font(.title)
                NumberPicker("Dollars", selection: $integralPart, range: 0...999)
                Text(".").font(.title)
                NumberPicker("Cents", selection: $fractionalPart, range: 0...99)
            }

            Text("USD 1.00 = \(model.code) \(model.rate.stringRoundedToFourPlaces)").font(.footnote)

            Divider()

            Text(conversion.currencyString(for: model.locale)).font(.headline)
        }.navigationBarTitle(Text(model.flag))
    }

    // MARK: Initializers

    init(with model: CurrencyModel) {
        self.model = model
    }
}

// MARK: - View Components

extension CurrencyView {
    private struct NumberPicker: View {

        // MARK: Instance Properties

        private var title: String
        private var selection: Binding<Int>
        private var numbers: [Int]

        // MARK: Body

        var body: some View {
            Picker(title, selection: selection) {
                ForEach(numbers) {
                    Text($0.twoDigitString)
                }
            }.frame(height: 75.0)
        }

        // MARK: Initializers

        init(_ title: String, selection: Binding<Int>, range: ClosedRange<Int>) {
            self.title = title
            self.selection = selection
            self.numbers = Array(range)
        }
    }
}

// MARK: - Previews

struct CurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyView(with: CurrencyListModel().currencies.first!)
    }
}
