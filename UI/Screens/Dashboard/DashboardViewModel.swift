import Foundation
import Combine

class DashboardViewModel: ObservableObject {
    @Published var totalSpace: String = ""
    @Published var freeSpace: String = ""
    @Published var usedSpace: String = ""
    @Published var usedPercentage: Double = 0.0
    
    private var storageService = StorageService.shared
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupBindings()
        storageService.updateStorageInfo()
    }
    
    private func setupBindings() {
        storageService.$totalDiskSpaceInBytes
            .map { self.storageService.formatBytes($0) }
            .assign(to: \.totalSpace, on: self)
            .store(in: &cancellables)
        
        storageService.$freeDiskSpaceInBytes
            .map { self.storageService.formatBytes($0) }
            .assign(to: \.freeSpace, on: self)
            .store(in: &cancellables)
            
        storageService.$usedDiskSpaceInBytes
            .map { self.storageService.formatBytes($0) }
            .assign(to: \.usedSpace, on: self)
            .store(in: &cancellables)
            
        // Recalculate percentage when used or total changes
        Publishers.CombineLatest(storageService.$usedDiskSpaceInBytes, storageService.$totalDiskSpaceInBytes)
            .map { used, total in
                guard total > 0 else { return 0.0 }
                return Double(used) / Double(total)
            }
            .assign(to: \.usedPercentage, on: self)
            .store(in: &cancellables)
    }
    
    func refreshData() {
        storageService.updateStorageInfo()
    }
}
