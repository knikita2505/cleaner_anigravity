import SwiftUI

struct AppCard<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .padding(20)
            .background(AppColors.cardBackground)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.3), radius: 12, x: 0, y: 4)
    }
}

struct AppCard_Previews: PreviewProvider {
    static var previews: some View {
        AppCard {
            Text("Card Content")
                .foregroundColor(.white)
        }
        .padding()
        .background(AppColors.background)
        .previewLayout(.sizeThatFits)
    }
}
