import SwiftUI

struct ProgressBar: View {
    var value: Double // 0.0 to 1.0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // Background
                Capsule()
                    .fill(Color.white.opacity(0.1))
                    .frame(height: 8)
                
                // Active Bar
                Capsule()
                    .fill(AppGradients.activeBar)
                    .frame(width: min(CGFloat(self.value) * geometry.size.width, geometry.size.width), height: 8)
            }
        }
        .frame(height: 8)
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(value: 0.6)
            .padding()
            .background(AppColors.background)
            .previewLayout(.sizeThatFits)
    }
}
