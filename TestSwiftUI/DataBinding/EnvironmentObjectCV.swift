import SwiftUI

public class EnvironmentObjectModel: ObservableObject {
        
    @Published var dateTime = "Hello"
    
    public init() {
        
    }
        
}

// 記得要在建構 EnvironmentObjectCV 時添加 ObservableObject 的設定：
// EnvironmentObjectCV().environmentObject(EnvironmentObjectModel())
public struct EnvironmentObjectCV: View {
    
    @EnvironmentObject
    var model: EnvironmentObjectModel
    
    public init() {
        
    }
    
    public var body: some View {
        VStack(spacing: 10) {
            Text(self.model.dateTime)
            PassByView()
        }
        
    }
    
}

struct PassByView: View {
    
    var body: some View {
        MyEnvironmentButton()
    }
    
}

struct MyEnvironmentButton: View {
    
    @EnvironmentObject
    var model: EnvironmentObjectModel
    
    var body: some View {
        Button(action: {
            self.model.dateTime = Date().description
        }) {
            Text("tell time")
        }
    }
    
}

struct EnvironmentObjectCV_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectCV()
    }
}
