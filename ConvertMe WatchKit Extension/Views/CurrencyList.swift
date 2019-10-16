import SwiftUI

// MARK: - View

struct CurrencyList: View {
    
    // MARK: Data Properties
    
    @ObservedObject private var model: CurrencyListModel
    
    // MARK: Body
    
    var body: some View {
        List {
            ForEach(model.currencies) { currency in
                NavigationLink(destination: CurrencyView(with: currency)) {
                    CurrencyCell(with: currency)
                }
            }
            .onMove { self.model.move(from: $0, to: $1) }
            .onDelete { self.model.delete(at: $0) }
        }.listStyle(CarouselListStyle())
            .navigationBarTitle("Currency List")
    }
    
    // MARK: Initializers
    
    init(with model: CurrencyListModel) {
        self.model = model
    }
}

// MARK: - View Components

extension CurrencyList {
    private struct CurrencyCell: View {
        
        // MARK: Instance Properties
        
        private var model: CurrencyModel
        
        // MARK: Body
        
        var body: some View {
            HStack {
                Text(model.flag).font(.title)
                
                VStack(alignment: .leading) {
                    Text(model.name).font(.system(.headline, design: .rounded))
                    Text("Code: " + model.code)
                    Text("Rate: " + model.rate.stringRoundedToFourPlaces)
                }
            }.frame(height: 100.0)
        }
        
        // MARK: Initializers
        
        init(with model: CurrencyModel) {
            self.model = model
        }
    }
}

// MARK: - Previews

struct CurrencyList_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyList(with: CurrencyListModel())
    }
}
