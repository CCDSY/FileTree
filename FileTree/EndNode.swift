import Cocoa

public struct EndNode : Node {
    
    public let name: String
    public let size: Int
    
    private var frame = NSRect.zero
    
    public var connectionPoint: CGPoint { return CGPoint(x: frame.midX, y: frame.midY) }
    
    private let marginX: CGFloat = 12
    private let marginY: CGFloat = 8
    
    public private(set) var preferredSize = CGSize.zero
    
    private let stringAttributes: [String : Any]? = nil
    
    public var strokeColor = CGColor.black
    public var backgroundColor = CGColor.white
    
    public init(name: String, size: Int) {
        self.name = name
        self.size = size
        
        self.preferredSize = description.size(withAttributes: stringAttributes).insetBy(dx: -marginX, dy: -marginY)
    }
    
    public mutating func layout(in rect: NSRect) {
        frame = rect
    }
    
    public func draw(in rect: NSRect) {
        guard rect.intersects(frame) else { return }
        
        drawFrame(in: frame, withStrokeColor: strokeColor, backgroundColor: backgroundColor)
        
        if frame.size.encompass(other: description.size(withAttributes: stringAttributes)) {
            description.drawCentered(in: frame, withAttributes: stringAttributes)
        }
    }
    
}
