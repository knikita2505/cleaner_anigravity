import Foundation

class StorageService: ObservableObject {
    @Published var totalDiskSpaceInBytes: Int64 = 0
    @Published var freeDiskSpaceInBytes: Int64 = 0
    @Published var usedDiskSpaceInBytes: Int64 = 0
    
    static let shared = StorageService()
    
    private init() {
        updateStorageInfo()
    }
    
    func updateStorageInfo() {
        do {
            let systemAttributes = try FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory() as String)
            
            let space = (systemAttributes[FileAttributeKey.systemSize] as? NSNumber)?.int64Value
            let freeSpace = (systemAttributes[FileAttributeKey.systemFreeSize] as? NSNumber)?.int64Value
            
            self.totalDiskSpaceInBytes = space ?? 0
            self.freeDiskSpaceInBytes = freeSpace ?? 0
            self.usedDiskSpaceInBytes = (space ?? 0) - (freeSpace ?? 0)
        } catch {
            print("Error obtaining system memory info: \(error)")
        }
    }
    
    var usedPercentage: Double {
        guard totalDiskSpaceInBytes > 0 else { return 0 }
        return Double(usedDiskSpaceInBytes) / Double(totalDiskSpaceInBytes)
    }
    
    func formatBytes(_ bytes: Int64) -> String {
        let formatter = ByteCountFormatter()
        formatter.allowedUnits = [.useGB, .useMB]
        formatter.countStyle = .file
        return formatter.string(fromByteCount: bytes)
    }
}
