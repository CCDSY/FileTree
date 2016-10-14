import Foundation

public protocol DisplayItem {
    
    var preferredSize: CGSize { get }
    
    func draw(in rect: NSRect)
    
    mutating func layout(in rect: NSRect)
    
}
