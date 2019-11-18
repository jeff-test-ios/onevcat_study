import SwiftUI

public struct StateCV: View {
    
    // 使用 @State 修飾的成員，在對該屬性賦值時，會觸發 View 的刷新；底層渲染引擎會找出介面上被改變的部分，根據新的屬性值，計算出新的 View 並進行刷新。
    @State
    private var dateTime = "Hello"
    
    public init() {
        
    }
    
    public var body: some View {
        VStack(spacing: 10) {
            Text(dateTime)
            Button(action: {
                self.dateTime = Date().description
            }) {
                Text("tell time")
            }
        }
    }
    
}

struct StateCV_Previews: PreviewProvider {
    static var previews: some View {
        StateCV()
    }
}
