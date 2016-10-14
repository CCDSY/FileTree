import Foundation

public protocol Node : DisplayItem {
    
    var name: String { get }
    var size: Int { get }
    
    init?(url: URL)
    
    var connectionPoint: CGPoint { get }
    
}
