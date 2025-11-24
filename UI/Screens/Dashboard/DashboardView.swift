import SwiftUI

struct DashboardView: View {
    @StateObject private var viewModel = DashboardViewModel()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                AppColors.background.edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(spacing: 24) {
                        // Storage Card
                        storageCard
                        
                        // Categories Grid
                        LazyVGrid(columns: columns, spacing: 16) {
                            CategoryCard(title: "Photos", icon: "photo.on.rectangle", color: AppColors.primaryBlue)
                            CategoryCard(title: "Videos", icon: "play.rectangle", color: AppColors.purple)
                            CategoryCard(title: "Contacts", icon: "person.crop.circle", color: AppColors.lightPurple)
                            CategoryCard(title: "Secret", icon: "lock.shield", color: AppColors.blueGlow)
                        }
                    }
                    .padding(20)
                }
            }
            .navigationTitle("Dashboard")
            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                viewModel.refreshData()
            }
        }
    }
    
    var storageCard: some View {
        AppCard {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Image(systemName: "iphone")
                        .font(.system(size: 24))
                        .foregroundColor(AppColors.primaryBlue)
                    Text("iPhone Storage")
                        .font(AppFonts.titleM)
                        .foregroundColor(AppColors.textPrimary)
                    Spacer()
                    Text("\(Int(viewModel.usedPercentage * 100))%")
                        .font(AppFonts.titleL)
                        .foregroundColor(AppColors.primaryBlue)
                }
                
                ProgressBar(value: viewModel.usedPercentage)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Used")
                            .font(AppFonts.caption)
                            .foregroundColor(AppColors.textTertiary)
                        Text(viewModel.usedSpace)
                            .font(AppFonts.subtitleM)
                            .foregroundColor(AppColors.textPrimary)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("Total")
                            .font(AppFonts.caption)
                            .foregroundColor(AppColors.textTertiary)
                        Text(viewModel.totalSpace)
                            .font(AppFonts.subtitleM)
                            .foregroundColor(AppColors.textPrimary)
                    }
                }
            }
        }
    }
}

struct CategoryCard: View {
    let title: String
    let icon: String
    let color: Color
    
    var body: some View {
        AppCard {
            VStack(alignment: .leading, spacing: 12) {
                Circle()
                    .fill(color.opacity(0.2))
                    .frame(width: 48, height: 48)
                    .overlay(
                        Image(systemName: icon)
                            .font(.system(size: 24))
                            .foregroundColor(color)
                    )
                
                Text(title)
                    .font(AppFonts.subtitleM)
                    .foregroundColor(AppColors.textPrimary)
                
                HStack {
                    Text("Scan")
                        .font(AppFonts.caption)
                        .foregroundColor(AppColors.textTertiary)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.system(size: 12))
                        .foregroundColor(AppColors.textTertiary)
                }
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .preferredColorScheme(.dark)
    }
}
