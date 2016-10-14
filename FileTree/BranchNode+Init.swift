//
//  BranchNode+Init.swift
//  FileTree
//
//  Created by CC on 9/27/16.
//  Copyright © 2016 CC. All rights reserved.
//

import Foundation

extension BranchNode {
    
    init?(url: URL) {
        guard url.hasDirectoryPath else { return nil }
        
        guard let directoryName = url.pathComponents.last else { return nil }
        
        let subNodes: [Node]
        do {
            let manager = FileManager.default
            let contents = try manager.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            subNodes = contents.map { node(for: $0)! }
        } catch {
            print("Error while getting attributes for item: \(url.path)")
            print(error)
            print()
            
            return nil
        }
        
        self.init(name: directoryName, subNodes: subNodes)
    }
    
}
