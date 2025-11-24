import Foundation
import Combine

class PhotoCleanerViewModel: ObservableObject {
    @Published var duplicateCount: Int = 0
    @Published var screenshotCount: Int = 0
    
    private var photoService = PhotoService.shared
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupBindings()
        photoService.fetchAssets()
    }
    
    private func setupBindings() {
        photoService.$duplicateGroups
            .map { $0.count }
            .assign(to: \.duplicateCount, on: self)
            .store(in: &cancellables)
            
        photoService.$screenshots
            .map { $0.count }
            .assign(to: \.screenshotCount, on: self)
            .store(in: &cancellables)
    }
}
