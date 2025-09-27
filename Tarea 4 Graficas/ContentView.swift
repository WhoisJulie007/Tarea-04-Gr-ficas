import SwiftUI
import Charts

struct ContentView: View {
    
    let valores: [(Int, String, Float)] = [
        (date: 1, month: "Sep", amount: 255),
        (date: 2, month: "Sep", amount: 51),
        (date: 3, month:"Sep",amount: 51.2),
        (date:4,month: "Sep", amount:103),
        (date:5,month: "Sep", amount:86),
        (date:6, month:"Sep", amount:108),
        (date:7, month:"Sep", amount:75),
        (date:8, month:"Sep", amount:53),
        (date:9, month:"Sep", amount:66),
        (date:10, month:"Sep", amount:54),
        (date:11, month:"Sep", amount:133),
        (date:12, month:"Sep", amount:171),
        (date:13, month:"Sep", amount:171),
        (date:14, month:"Sep", amount:171),
        (date:15, month:"Sep", amount:126),
        (date:16,month:"Sep", amount:122),
        (date:17, month:"Sep", amount:117),
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                Text("Top buyers of your inventory")
                    .font(.headline)
                    .padding()
                
                Chart {
                    ForEach(valores, id: \.0) { mes in
                        SectorMark(
                            angle: .value("Ganancias", mes.2),
                            innerRadius: .ratio(0.7),
                            angularInset: 1.5
                        )
                        .annotation(position: .overlay) {
                            Text("\(mes.0)")
                                .font(.caption2)
                                .foregroundColor(.white)
                        }
                    }
                }
                .frame(height: 300)
                .aspectRatio(1, contentMode: .fit)
                .padding()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
