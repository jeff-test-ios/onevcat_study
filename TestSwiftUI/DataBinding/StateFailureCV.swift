import SwiftUI

public struct StateFailureCV: View {
    
    @State
    private var dateTime = "Hello"
    
    public init() {
        
    }
    
    public var body: some View {
        VStack(spacing: 10) {
            Text(dateTime)
            // 用 @State 修飾的屬性值僅只能在屬性本身被設置時會觸發 UI 刷新，非常適合用來聲明一個實質型別(非參考型別)的變數。
            // 不過，這樣的值在不同對象間傳遞時，內容數據將會被複製，所以傳遞過後，每個實例 (instance) 都是獨立無關聯的，當然也就不會聯動刷新每個 View 的介面。
            MyButton(dateTime: self.dateTime)
        }
    }
    
}

struct MyButton: View {
    
    @State
    var dateTime = "Hello"
    
    var body: some View {
        Button(action: {
            self.dateTime = Date().description
        }) {
            Text("tell time")
        }
    }
    
}

struct StateFailureCV_Previews: PreviewProvider {
    static var previews: some View {
        StateFailureCV()
    }
}
