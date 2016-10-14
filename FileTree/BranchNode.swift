//
//  BranchNode.swift
//  FileTree
//
//  Created by CC on 9/27/16.
//  Copyright © 2016 CC. All rights reserved.
//

import Cocoa

struct BranchNode : Node {
    
    var connectionPoint: CGPoint { return layout.content.rootItem.connectionPoint }
    
    private var frame: NSRect = NSRect.zero
    private var layout: TopBottomLayoutContainer<EndNode>
    
    let preferredSize: CGSize
    
    let name: String
    let size: Int
    
    var connectionColor = CGColor.black
    
    init(name: String, subNodes: [Node]) {
        self.name = name
        self.size = subNodes.reduce(0) { $0 + $1.size }
        
        self.layout = TopBottomLayoutContainer(subItems: subNodes, rootItem: EndNode(name: name, size: size), horizontalSpacing: 12, verticalSpacing: 16)
        
        self.preferredSize = layout.preferredSize
    }
    
    mutating func layout(in rect: NSRect) {
        frame = rect
        layout.layout(in: rect)
    }
    
    func draw(in rect: NSRect) {
        guard rect.intersects(frame) else { return }
        
        let context = NSGraphicsContext.current()?.cgContext
        
        let rootNodeConnectionPoint = layout.content.rootItem.connectionPoint
        for node in layout.content.subItems as! [Node] {
            context?.addLines(between: [rootNodeConnectionPoint, node.connectionPoint])
        }
        
        context?.setStrokeColor(connectionColor)
        context?.strokePath()
        
        layout.draw(in: rect)
    }
    
}
