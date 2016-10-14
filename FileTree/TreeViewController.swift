//
//  TreeViewController.swift
//  FileTree
//
//  Created by CC on 9/29/16.
//  Copyright © 2016 CC. All rights reserved.
//

import Cocoa

class TreeViewController: NSViewController {
    
    fileprivate static let inset: InsetLayoutContainer.Inset = (10, 10)
    
    fileprivate static let maxZoomWidth: CGFloat = 200
    
    var tree: BranchNode? {
        get {
            return item?.content
        }
        set {
            if let value = newValue {
                item = InsetLayoutContainer(content: value, insets: TreeViewController.inset)
            } else {
                item = nil
            }
        }
    }
    private var item: InsetLayoutContainer<BranchNode>? {
        didSet {
            updateItemView()
        }
    }
    
    private var scrollView: NSScrollView { return view as! NSScrollView }
    
    private func updateItemView() {
        guard let item = self.item else { return }
        
        // set up views and data model for display
        let treeViewFrame = NSRect(origin: CGPoint.zero, size: item.preferredSize)
        let treeView = DisplayItemView(frame: treeViewFrame)
        treeView.item = item
        scrollView.documentView = treeView
        scrollView.wantsLayer = true
        treeView.canDrawSubviewsIntoLayer = true
        
        // change the size of the scroll view to fit the drawing
        // or change the aspect ratio to match the drawing
        //        if scrollView.frame.width > treeViewFrame.width && scrollView.frame.height > treeViewFrame.height {
        //            scrollView.frame = scrollView.frame.change(size: item.preferredSize)
        //        } else {
        //            let aspectRatio = item.preferredSize.width / item.preferredSize.height
        //
        //            if aspectRatio > 1 {
        //                scrollView.frame = scrollView.frame.change(height: scrollView.frame.width / aspectRatio)
        //            } else {
        //                scrollView.frame = scrollView.frame.change(width: scrollView.frame.height * aspectRatio)
        //            }
        //        }
        
        // set up scroll view for zooming
        //        scrollView.maxMagnification = scrollView.frame.width / TreeViewController.maxZoomWidth
        //        scrollView.minMagnification = scrollView.frame.width / treeViewFrame.width
        //        scrollView.magnification = scrollView.minMagnification
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateItemView()
    }
    
}
