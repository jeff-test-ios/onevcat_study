import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Text("0")
                .font(.system(size: 76))
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                .minimumScaleFactor(0.5)
                .padding(.horizontal, 24)
                .lineLimit(1)
            CalculatorButtonPad()
                .padding(.bottom)
        }.scaleEffect(UIScreen.main.bounds.width / 414)
    }
}

struct CalculatorButtonPad: View {
    
    let rows: [[CalculatorButtonItem]] = [
        [.command(.clear), .command(.flip), .command(.percent), .op(.divide)],
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        [.digit(1), .digit(2), .digit(3), .op(.plus)],
        [.digit(0), .dot, .op(.equal)]
    ]
    
    var body: some View {
        VStack(spacing: 8) {
            ForEach(rows, id: \.self) {
                CalculatorButtonRow(row: $0)
            }
        }
    }
}

struct CalculatorButtonRow: View {
    
    let row: [CalculatorButtonItem]
    
    var body: some View {
        HStack {
            ForEach(row, id: \.self) { item in
                CalculatorButton(title: item.title, size: item.size, backgroundColorName: item.backgroundColorName) {
                    print(item.title)
                }
            }
        }
    }
}

struct CalculatorButton: View {
    
    let title: String
    let fontSize: CGFloat = 38
    let size: CGSize
    let backgroundColorName: Color.ColorName
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
            .font(.system(size: fontSize))
            .foregroundColor(.primary)
            .frame(width: size.width, height: size.height)
            .background(Color(backgroundColorName))
            .cornerRadius(44)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.colorScheme, .dark)
            ContentView()
                .previewDevice("iPhone 8 Plus")
            ContentView()
                .previewLayout(.fixed(width: 375, height: 1000))
        }
    }
}
