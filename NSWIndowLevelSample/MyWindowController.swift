//
//  MyWindowController.swift
//  FrontmostWindow
//
//  Created by HIROKI IKEUCHI on 2020/03/16.
//  Copyright © 2020 hikeuchi. All rights reserved.
//

import Cocoa

class MyWindowController: NSWindowController {
    
    @IBOutlet weak var myWindow: NSPanel!
    @IBOutlet weak var windowLevelLabel: NSTextField!
    
    override var windowNibName : String? {
        return String(describing: type(of: self))
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        // フルスクリーン時に表示するための設定
        self.myWindow.styleMask.insert(.nonactivatingPanel)
        self.myWindow.collectionBehavior.insert(.canJoinAllSpaces)
        self.myWindow.collectionBehavior.insert(.fullScreenAuxiliary)
    }
}
