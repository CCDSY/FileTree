import Foundation

public extension EndNode {
    
    public init?(url: URL) {
        guard !url.hasDirectoryPath else { return nil }
        
        guard let fileName = url.pathComponents.last else { return nil }
        
        let size: Int
        do {
            let manager = FileManager.default
            let attributes = try manager.attributesOfItem(atPath: url.path)
            size = attributes[FileAttributeKey.size]! as! Int
        } catch {
            print("Error while getting attributes for item: \(url.path)")
            print(error)
            print()
            
            return nil
        }
        
        self.init(name: fileName, size: size)
    }
    
}
