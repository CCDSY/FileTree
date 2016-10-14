//
//  TestView.swift
//  FileTree
//
//  Created by CC on 9/26/16.
//  Copyright © 2016 CC. All rights reserved.
//

import Cocoa

class DisplayItemView: NSView {

    var item: DisplayItem? = nil {
        didSet {
            if oldValue == nil {
                needsDisplay = true
                needsLayout = true
            }
        }
    }

    override var isOpaque: Bool { return true }

    override var wantsUpdateLayer: Bool { return true }

    override func updateLayer() {
        guard let layer = self.layer else { return }

        layer.backgroundColor = CGColor.white
        
        
    }

    override func draw(_ dirtyRect: NSRect) {
        if let context = NSGraphicsContext.current()?.cgContext {
            context.setFillColor(CGColor.white)
            context.addRect(dirtyRect)
            context.fillPath()
        }
        item?.draw(in: dirtyRect)
    }

    override func layout() {
        item?.layout(in: bounds)
    }

}
