import SwiftUI

class Model: ObservableObject {
        
    @Published var dateTime = "Hello"
        
}

public struct ObservableObjectWithBindingCV: View {
    
    @ObservedObject
    var model = Model()
    
    public init() {
        
    }
    
    public var body: some View {
        VStack(spacing: 10) {
            Text(self.model.dateTime)
            MyObservableButton(model: self.model)
        }
    }
    
}

struct MyObservableButton: View {
    
    var model: Model
    
    var body: some View {
        Button(action: {
            self.model.dateTime = Date().description
        }) {
            Text("tell time")
        }
    }
    
}


struct ObservableObjectWithBindingCV_Previews: PreviewProvider {
    static var previews: some View {
        ObservableObjectWithBindingCV()
    }
}
