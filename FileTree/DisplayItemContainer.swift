import Foundation

public protocol DisplayItemContainer : DisplayItem {
    
    associatedtype Content
    
    var content: Content { get }
    
    init(content: Content)
    
}
