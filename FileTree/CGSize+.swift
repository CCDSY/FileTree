import Foundation

public func *(size: CGSize, scale: CGFloat) -> NSSize {
    return NSSize(width: size.width * scale, height: size.height * scale)
}

public extension CGSize {
    
    public func scale(xScale: CGFloat, yScale: CGFloat) -> CGSize {
        return CGSize(width: width * xScale, height: height * yScale)
    }
    
    public func insetBy(dx: CGFloat, dy: CGFloat) -> CGSize {
        return CGSize(width: width - dx * 2, height: height - dy * 2)
    }
    
    public func encompass(other: CGSize) -> Bool {
        return width >= other.width && height >= other.height
    }
    
}
