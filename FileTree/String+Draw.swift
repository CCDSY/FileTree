import Foundation

public extension String {
    
    public func draw(at point: NSPoint, withAttributes attributes: [String : Any]?) {
        NSString(string: self).draw(at: point, withAttributes: attributes)
    }
    
    public func draw(in rect: NSRect, withAttributes attributes: [String : Any]?) {
        NSString(string: self).draw(in: rect, withAttributes: attributes)
    }
    
    public func drawCentered(in rect: NSRect, withAttributes attributes: [String : Any]?) {
        let size = self.size(withAttributes: attributes)
        let point = NSPoint(x: rect.midX - size.width / CGFloat(2), y: rect.midY - size.height / CGFloat(2))
        draw(at: point, withAttributes: nil)
    }
    
    public func size(withAttributes attributes: [String : Any]?) -> CGSize {
        return NSString(string: self).size(withAttributes: attributes)
    }
    
}
