//
//  Node+Init.swift
//  FileTree
//
//  Created by CC on 9/27/16.
//  Copyright © 2016 CC. All rights reserved.
//

import Foundation

func node(for url: URL) -> Node? {
    return url.hasDirectoryPath ? BranchNode(url: url) : EndNode(url: url)
}

func node(at path: String) -> Node? {
    return node(for: URL(fileURLWithPath: path))
}

func node(at path: String, relativeTo baseUrl: URL) -> Node? {
    return node(for: URL(fileURLWithPath: path, relativeTo: baseUrl))
}

extension Node {
    
    init?(path: String) {
        self.init(url: URL(fileURLWithPath: path))
    }
    
    init?(path: String, relativeTo baseUrl: URL) {
        self.init(url: URL(fileURLWithPath: path, relativeTo: baseUrl))
    }
    
}
