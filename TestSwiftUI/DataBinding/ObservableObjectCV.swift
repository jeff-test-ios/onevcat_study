import SwiftUI

public struct ObservableObjectCV: View {

    class Model: ObservableObject {
            
//        let objectWillChange = PassthroughSubject<Void, Never>()
        // 上面這行其實可不寫， ObservableObject 物件會自動生成，而且就算不寫，也仍可在 willSet 被調用。
            
//        var dateTime = "Hello" {
//            willSet {
//                self.objectWillChange.send()
//            }
//        }
        // 上面的寫法，與這行寫法等價
        @Published var dateTime = "Hello"
            
    }
        
    @ObservedObject
    var model = Model()
    
    public init() {
        
    }
        
    public var body: some View {
        VStack(spacing: 10) {
            Text(self.model.dateTime)
            Button(action: {
                self.model.dateTime = Date().description
            }) {
                Text("tell time")
            }
        }
    }

}

struct ObservableObjectCV_Previews: PreviewProvider {
    static var previews: some View {
        ObservableObjectCV()
    }
}
