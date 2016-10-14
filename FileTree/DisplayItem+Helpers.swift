import Cocoa

public extension DisplayItem {
    
    public func drawFrame(in rect: NSRect, withStrokeColor strokeColor: CGColor, backgroundColor: CGColor) {
        if let context = NSGraphicsContext.current()?.cgContext {
            context.setStrokeColor(strokeColor)
            context.setFillColor(backgroundColor)
            context.addRect(rect)
            context.drawPath(using: .fillStroke)
        }
    }
    
}
