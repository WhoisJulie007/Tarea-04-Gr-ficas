import SwiftUI
import Charts

struct SaleData: Identifiable {
    let id = UUID()
    let date: Int
    let month: String
    let amount: Float
}

struct TopBuyers: Identifiable {
    let id = UUID()
    let company: String
    let amount: Float
}

struct CountryBuyers: Identifiable {
    let id = UUID()
    let countrys: String
    let amount: Float
}

struct ContentView: View {
    
    let country: [CountryBuyers] = [
        CountryBuyers(countrys:"Mexico" , amount: 213546 ),
        CountryBuyers(countrys:"Colombia" , amount:70663 ),
        CountryBuyers(countrys:"Argentina" , amount:70369 ),
        CountryBuyers(countrys:"Peru" , amount:52825 ),
        CountryBuyers(countrys:"Chile" , amount:52122 ),
        CountryBuyers(countrys:"Ecuador" , amount:34649 ),
        CountryBuyers(countrys:"Bolivia" , amount:32137 ),
        CountryBuyers(countrys:"Costa Rica" , amount:22998 ),
        CountryBuyers(countrys:"Guatemala" , amount:18612 ),
        CountryBuyers(countrys:"Panama" , amount:14899 ),
        
    ]
    
    let buyers: [TopBuyers] = [
        TopBuyers(company: "Hangzhou Kuaizhi Technology", amount: 504135),
        TopBuyers(company:"Others", amount: 442495),
        TopBuyers(company:"Mercado Libre", amount:184121),
        TopBuyers(company:"TEMU", amount:80293),
        TopBuyers(company:"Netflix", amount:37002),
    ]
    
    let valores: [SaleData] = [
        SaleData(date: 1, month: "Sep", amount: 255),
        SaleData(date: 2, month: "Sep", amount: 51),
        SaleData(date: 3, month: "Sep", amount: 51.2),
        SaleData(date: 4, month: "Sep", amount: 103),
        SaleData(date: 5, month: "Sep", amount: 86),
        SaleData(date: 6, month: "Sep", amount: 108),
        SaleData(date: 7, month: "Sep", amount: 75),
        SaleData(date: 8, month: "Sep", amount: 53),
        SaleData(date: 9, month: "Sep", amount: 66),
        SaleData(date: 10, month: "Sep", amount: 54),
        SaleData(date: 11, month: "Sep", amount: 133),
        SaleData(date: 12, month: "Sep", amount: 171),
        SaleData(date: 13, month: "Sep", amount: 171),
        SaleData(date: 14, month: "Sep", amount: 171),
        SaleData(date: 15, month: "Sep", amount: 126),
        SaleData(date: 16, month: "Sep", amount: 122),
        SaleData(date: 17, month: "Sep", amount: 117),
    ]
    
    var body: some View {
        NavigationStack {
        ScrollView(.vertical, showsIndicators: true) {
            NavigationLink(destination: LineChartView()) {
                Text("Line Chart")
            }
            VStack {
                Text("Top buyers of your inventory")
                    .font(.headline)
                    .padding()
                
                Chart(buyers) { sale in
                    SectorMark(
                        angle: .value("Amount", sale.amount),
                        innerRadius: .ratio(0.618),
                        outerRadius: .inset(10),
                    )
                    .foregroundStyle(by: .value("Company", sale.company))
                }
                .frame(height: 300)
                .padding()
                
                //------------------------------------------------
                
                Chart {
                    ForEach(country) { country in
                        BarMark(
                            x: .value("Country", country.countrys),
                            y: .value("Sales", country.amount)
                        )
                        .cornerRadius(4)
                        .foregroundStyle(by: .value("Country", country.countrys))
                    }
                }
                .frame(height: 300)
                .padding()
                
                //------------------------------------------------
                
                Chart {
                    ForEach(valores) { valor in
                        AreaMark(
                            x: .value("Date", "\(valor.date) \(valor.month)"),
                            y: .value("Sales", valor.amount)
                        )
                        .cornerRadius(4)
                        .foregroundStyle(by: .value("Sales", valor.amount))
                    }
                }
                .frame(height: 300)
                .padding()
                
            }
        }
        .padding()
        }
    }
}


#Preview {
    ContentView()
}
