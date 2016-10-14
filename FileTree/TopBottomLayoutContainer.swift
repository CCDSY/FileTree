//
//  TopBottomLayout.swift
//  FileTree
//
//  Created by CC on 9/27/16.
//  Copyright © 2016 CC. All rights reserved.
//

import Foundation

struct TopBottomLayoutContainer<RootItem: DisplayItem> : DisplayItemContainer {
    
    typealias SubItem = DisplayItem
    
    typealias Content = (subItems: [SubItem], rootItem: RootItem)
    
    private var subItems: [SubItem]
    private var rootItem: RootItem
    
    var content: Content { return (subItems, rootItem) }
    
    private let subItemsWidth: CGFloat
    private let subItemsHeight: CGFloat
    
    private let bubbleHead: Bool
    
    let preferredSize: CGSize
    
    private let horizontalSpacing: CGFloat
    private let verticalSpacing: CGFloat
    
    init(subItems: [SubItem], rootItem: RootItem, horizontalSpacing: CGFloat, verticalSpacing: CGFloat) {
        self.subItems = subItems
        self.rootItem = rootItem
        
        self.horizontalSpacing = horizontalSpacing
        self.verticalSpacing = verticalSpacing
        
        subItemsWidth = subItems.reduce(0) { $0 + $1.preferredSize.width } + (horizontalSpacing * CGFloat(subItems.count - 1))
        subItemsHeight = subItems.map { $0.preferredSize.height }.max() ?? 0
        
        bubbleHead = rootItem.preferredSize.width > subItemsWidth
        let width = bubbleHead ? rootItem.preferredSize.width : subItemsWidth
        let height = subItemsHeight + rootItem.preferredSize.height + verticalSpacing
        
        preferredSize = CGSize(width: width, height: height)
    }
    
    mutating func layout(in rect: NSRect) {
        let horizontalScale = rect.width / preferredSize.width
        let verticalScale = rect.height / preferredSize.height
        
        let rootSize = rootItem.preferredSize.scale(xScale: horizontalScale, yScale: verticalScale)
        
        let x = rect.midX - rootSize.width / 2
        let y = rect.maxY - rootSize.height
        
        rootItem.layout(in: NSRect(origin: CGPoint(x: x, y: y), size: rootSize))
        
        var left = bubbleHead ? rect.midX - subItemsWidth * horizontalScale / 2 : rect.minX
        let top = y - verticalSpacing
        for i in 0 ..< subItems.count {
            let itemSize = subItems[i].preferredSize.scale(xScale: horizontalScale, yScale: verticalScale)
            let origin = CGPoint(x: left, y: top - itemSize.height)
            subItems[i].layout(in: NSRect(origin: origin, size: itemSize))
            
            left += itemSize.width
            left += horizontalSpacing
        }
    }
    
    func draw(in rect: NSRect) {        
        for item in subItems {
            item.draw(in: rect)
        }
        
        rootItem.draw(in: rect)
    }
    
}

extension TopBottomLayoutContainer {
    
    init(content: Content) {
        self.init(subItems: content.subItems, rootItem: content.rootItem)
    }
    
    init(subItems: [SubItem], rootItem: RootItem) {
        self.init(subItems: subItems, rootItem: rootItem, horizontalSpacing: 0, verticalSpacing: 0)
    }
    
}
