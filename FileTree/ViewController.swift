//
//  ViewController.swift
//  FileTree
//
//  Created by CC on 9/26/16.
//  Copyright © 2016 CC. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    fileprivate static let displayTreeSegueIdentifier = "displayTree"
    
    private var tree: BranchNode?
    
    @IBAction func chooseDirectory(_ sender: NSButton) {
        let panel = NSOpenPanel()
        
        panel.canChooseFiles = false
        panel.canChooseDirectories = true
        panel.treatsFilePackagesAsDirectories = true
        
        panel.beginSheetModal(for: view.window!) { [unowned self] resultID in
            guard resultID == NSFileHandlingPanelOKButton else { return }
            guard let resultPath = panel.urls.first?.path else { return }
            let result = URL(fileURLWithPath: resultPath)
            
            self.tree = BranchNode(url: result)
            self.performSegue(withIdentifier: ViewController.displayTreeSegueIdentifier, sender: self)
        }
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if let treeViewController = segue.destinationController as? TreeViewController {
            treeViewController.tree = tree
        }
    }
    
}

