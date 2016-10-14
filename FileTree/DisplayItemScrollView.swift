//
//  DisplayItemScrollView.swift
//  FileTree
//
//  Created by CC on 9/29/16.
//  Copyright © 2016 CC. All rights reserved.
//

import Cocoa

class DisplayItemScrollView: NSScrollView {
    
    fileprivate static let maxZoomWidth: CGFloat = 200
    fileprivate static let minMagnificationLimit: CGFloat = 0.3
    
    var item: DisplayItem? {
        didSet {
            updateItemView()
        }
    }
    
    private var itemView: DisplayItemView? {
        get {
            return documentView as? DisplayItemView
        }
        set {
            documentView = newValue
        }
    }
    
    private func createItemView() {
        let itemViewFrame = NSRect(origin: CGPoint.zero, size: item?.preferredSize ?? CGSize.zero)
        itemView = DisplayItemView(frame: itemViewFrame)
    }
    
    private func updateItemView() {
        if itemView == nil {
            createItemView()
        }
        
        itemView!.item = item
        
        adaptToContent()
        
        setupMagnification()
        
        magnification = minMagnification
    }
    
    private func adaptToContent() {
        guard let item = self.item else { return }
        
        if frame.width > item.preferredSize.width && frame.height > item.preferredSize.height {
            frame = frame.change(size: item.preferredSize)
        }
    }
    
    func setupMagnification() {
        guard let itemView = documentView else { return }
        
        let oldMagnificationRange = maxMagnification - minMagnification
        
        maxMagnification = frame.width / DisplayItemScrollView.maxZoomWidth
        minMagnification = max(frame.width / itemView.frame.width, DisplayItemScrollView.minMagnificationLimit)
        
        let newMagnificationRange = maxMagnification - minMagnification
        
        magnification *= newMagnificationRange / oldMagnificationRange
    }
    
    override func resize(withOldSuperviewSize oldSize: NSSize) {
        super.resize(withOldSuperviewSize: oldSize)
        
        setupMagnification()
    }
    
}
