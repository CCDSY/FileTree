import Foundation

struct InsetLayoutContainer<Content : DisplayItem> : DisplayItemContainer {
    
    typealias Inset = (dx: CGFloat, dy: CGFloat)
    
    private let insets: Inset
    var preferredSize: CGSize {
        return content.preferredSize.insetBy(dx: -insets.dx, dy: -insets.dy)
    }
    
    private(set) var content: Content
    
    init(content: Content, insets: Inset) {
        self.content = content
        self.insets = insets
    }
    
    mutating func layout(in rect: NSRect) {
        content.layout(in: rect.insetBy(dx: insets.dx, dy: insets.dy))
    }
    
    func draw(in rect: NSRect) {
        content.draw(in: rect)
    }
    
}

extension InsetLayoutContainer {
    
    init(content: Content) {
        self.init(content: content, insets: (0, 0))
    }
    
}
