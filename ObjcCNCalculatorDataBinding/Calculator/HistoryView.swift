import SwiftUI

struct HistoryView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var model: CalculatorModel
    
    var body: some View {
        VStack {
            if model.totalCount == 0 {
                Text("没有履历")
            } else {
                HStack {
                    Text("履历")
                        .font(.headline)
                    Text("\(model.historyDetail)")
                        .lineLimit(nil)
                }
                HStack {
                    Text("显示")
                        .font(.headline)
                    Text("\(model.brain.output)")
                }
                Slider(
                    value: $model.slidingIndex,
                    in: 0...Float(model.totalCount),
                    step: 1
                )
            }
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("exit")
            })
        }.padding()
    }
}
