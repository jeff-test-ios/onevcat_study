import SwiftUI

public struct BindingCV: View {
    
    public init() {
        
    }
    
    public var body: some View {
        MyStack()
    }
    
}

struct MyStack: View {
    
    @State
    private var dateTime = "Hello"
    
    var body: some View {
        VStack(spacing: 10) {
            Text(self.dateTime)
            // 由 @ 符號修飾的屬性，在他前面使用 $ 符號所取得的值被稱為投影屬性。(projection property)
            // 有些 @ 屬性，比如這裡的 @State 和 @Binding，它們的投影屬性就是自身所對應值的 Binding 類型。
            // 不過要注意的是，並不是所有的 @ 屬性都提供 $ 的投影訪問方式。
            MyBindingButton(dateTime: $dateTime)
        }
    }
    
}

struct MyBindingButton: View {
    
    // @Binding 修飾過後可將變數由實質型別轉換為非參考型別，進而達到跨物件同步刷新資訊。
    @Binding var dateTime: String
    
    var body: some View {
        Button(action: {
            self.dateTime = Date().description
        }) {
            Text("tell time")
        }
    }
    
}

struct BindingCV_Previews: PreviewProvider {
    static var previews: some View {
        BindingCV()
    }
}
