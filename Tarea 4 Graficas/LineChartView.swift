import SwiftUI
import Charts
import WebKit

struct RuletaData: Identifiable {
    var id = UUID()
    var descripcion: String
    var valor: Double
    var color: Color
}

struct LineChartView: View {
    @State private var rotation: Double = 0
    
    let ruletas: [RuletaData] = [
        RuletaData(descripcion: "0", valor: 1, color: .blue),
        RuletaData(descripcion: "-1", valor: 1, color: .red),
        RuletaData(descripcion: "Transfiere 1", valor: 1, color: .red),
        RuletaData(descripcion: "0", valor: 1, color: .gray),
        RuletaData(descripcion: "-2", valor: 1, color: .green),
        RuletaData(descripcion: "Transfiere 2", valor: 1, color: .purple),
        RuletaData(descripcion: "0", valor: 1, color: .yellow),
        RuletaData(descripcion: "-3", valor: 1, color: .gray),
        RuletaData(descripcion: "Transfiere 3", valor: 1, color: .black)
    ]
    
    var body: some View {
        VStack {
            Text("Ruleta")
                .font(.headline)
                .padding()
            
            ZStack {
                Chart(ruletas) { item in
                    SectorMark(
                        angle: .value("Valor", item.valor),
                        angularInset: 0
                    )
                    .foregroundStyle(item.color)
                    .annotation(position: .overlay, alignment: .center) {
                        Text(item.descripcion)
                            .font(.caption2)
                            .foregroundColor(.white)
                    }
                }
                .rotationEffect(.degrees(rotation))
                .frame(height: 300)
                
                Button(action: {
                    let extraRotation = Double.random(in: 0..<360)
                    withAnimation(.easeOut(duration: 3.0)) {
                        rotation += 1080 + extraRotation
                    }
                }) {
                    VStack {
                        Image(systemName: "arrowshape.backward.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                            .padding(.top, 10)
                    }
                }
            }
            
            GifView(url: "https://i.pinimg.com/originals/42/0e/39/420e39bd34d74ffae5c6af92a701d5cb.gif")
                .frame(width: 200, height: 200)
                .padding(.top, 20)
        }
    }
}

struct GifView: UIViewRepresentable {
    let url: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        if let gifURL = URL(string: url) {
            let request = URLRequest(url: gifURL)
            webView.scrollView.isScrollEnabled = false
            webView.load(request)
        }
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

// Preview
#Preview {
    LineChartView()
}
