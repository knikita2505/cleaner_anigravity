import SwiftUI

struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(AppFonts.subtitleL)
                .foregroundColor(AppColors.textPrimary)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(AppGradients.cta)
                .cornerRadius(16)
                .shadow(color: AppColors.primaryBlue.opacity(0.3), radius: 12, x: 0, y: 4)
        }
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(title: "Clean Now", action: {})
            .padding()
            .background(AppColors.background)
            .previewLayout(.sizeThatFits)
    }
}
