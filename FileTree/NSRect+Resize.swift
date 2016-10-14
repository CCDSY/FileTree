import Foundation

extension NSRect {
    
    public func resize(to size: CGSize) -> NSRect {
        let x = midX - size.width / 2
        let y = midY - size.height / 2
        return NSRect(x: x, y: y, width: size.width, height: size.height)
    }
    
    public func change(size: CGSize) -> NSRect {
        return NSRect(origin: self.origin, size: size)
    }
    
    public func change(origin: CGPoint) -> NSRect {
        return NSRect(origin: origin, size: self.size)
    }
    
    public func change(x: CGFloat) -> NSRect {
        return change(origin: CGPoint(x: x, y: origin.y))
    }
    
    public func change(y: CGFloat) -> NSRect {
        return change(origin: CGPoint(x: origin.x, y: y))
    }
    
    public func change(width: CGFloat) -> NSRect {
        return change(size: CGSize(width: width, height: size.height))
    }
    
    public func change(height: CGFloat) -> NSRect {
        return change(size: CGSize(width: size.width, height: height))
    }
    
}
