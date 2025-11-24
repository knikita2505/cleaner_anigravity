import SwiftUI

struct PhotoCleanerView: View {
    @StateObject private var viewModel = PhotoCleanerViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                AppColors.background.edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(spacing: 16) {
                        // Duplicates
                        CleaningCategoryCard(
                            title: "Duplicate Photos",
                            subtitle: "\(viewModel.duplicateCount) groups found",
                            icon: "photo.on.rectangle.angled",
                            color: AppColors.primaryBlue
                        )
                        
                        // Screenshots
                        CleaningCategoryCard(
                            title: "Screenshots",
                            subtitle: "\(viewModel.screenshotCount) found",
                            icon: "camera.viewfinder",
                            color: AppColors.purple
                        )
                        
                        // Similar
                        CleaningCategoryCard(
                            title: "Similar Photos",
                            subtitle: "Scan to find",
                            icon: "square.on.square",
                            color: AppColors.lightPurple
                        )
                    }
                    .padding(20)
                }
            }
            .navigationTitle("Photo Cleaner")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct CleaningCategoryCard: View {
    let title: String
    let subtitle: String
    let icon: String
    let color: Color
    
    var body: some View {
        AppCard {
            HStack(spacing: 16) {
                Circle()
                    .fill(color.opacity(0.2))
                    .frame(width: 48, height: 48)
                    .overlay(
                        Image(systemName: icon)
                            .font(.system(size: 20))
                            .foregroundColor(color)
                    )
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(AppFonts.subtitleM)
                        .foregroundColor(AppColors.textPrimary)
                    Text(subtitle)
                        .font(AppFonts.caption)
                        .foregroundColor(AppColors.textTertiary)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14))
                    .foregroundColor(AppColors.textTertiary)
            }
        }
    }
}

struct PhotoCleanerView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCleanerView()
            .preferredColorScheme(.dark)
    }
}
