import SwiftUI

struct AppGradients {
    static let cta = LinearGradient(
        gradient: Gradient(colors: [Color(hex: "3B5BFF"), Color(hex: "7A4DFB")]),
        startPoint: .leading,
        endPoint: .trailing
    )
    
    static let aurora = LinearGradient(
        gradient: Gradient(colors: [Color(hex: "2F3DAF"), Color(hex: "6B3BDB"), Color(hex: "8B5CFF")]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    static let activeBar = LinearGradient(
        gradient: Gradient(colors: [Color(hex: "FF8D4D"), Color(hex: "FFD36B")]),
        startPoint: .leading,
        endPoint: .trailing
    )
}
