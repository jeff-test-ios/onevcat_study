import SwiftUI

extension Color {
    
    enum ColorName: String {
        case commandBackground = "commandBackground"
        case digitBackground = "digitBackground"
        case operatorBackground = "operatorBackground"
    }
    
    init(_ name: ColorName) {
        self.init(name.rawValue)
    }
}
