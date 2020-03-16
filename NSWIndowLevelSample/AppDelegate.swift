//
//  AppDelegate.swift
//  NSWIndowLevelSample
//
//  Created by HIROKI IKEUCHI on 2020/03/16.
//  Copyright © 2020 hikeuchi. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    var myWindowControllerList = [MyWindowController]()
    
    struct WindowControllerPropertyKey {
        static let nameKey        = "name"
        static let windowLevelKey = "windowLevel"
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        var windowSettings:[Dictionary<String, Any>] = []

        // [NSWindow\.Level](https://developer.apple.com/documentation/appkit/nswindow/level)
        // [NSWindowLevel Enum](https://docs.microsoft.com/en-us/dotnet/api/appkit.nswindowlevel?view=xamarin-mac-sdk-14)
        // 上表の通り、数字の順で間違い無さそう。下に行くほど最前面
//        windowSettings.append([WindowControllerPropertyKey.nameKey        : ".normal",
//                               WindowControllerPropertyKey.windowLevelKey : NSWindow.Level.normal])
        
        // 以下3つは同じ優先度
        windowSettings.append([WindowControllerPropertyKey.nameKey        : ".submenu",
                               WindowControllerPropertyKey.windowLevelKey : NSWindow.Level.submenu])
        windowSettings.append([WindowControllerPropertyKey.nameKey        : ".tornOffMenu",
                               WindowControllerPropertyKey.windowLevelKey : NSWindow.Level.tornOffMenu])
        windowSettings.append([WindowControllerPropertyKey.nameKey        : ".floating",
                               WindowControllerPropertyKey.windowLevelKey : NSWindow.Level.floating])
        
        windowSettings.append([WindowControllerPropertyKey.nameKey        : ".modalPanel",
                               WindowControllerPropertyKey.windowLevelKey : NSWindow.Level.modalPanel])
        windowSettings.append([WindowControllerPropertyKey.nameKey        : ".mainMenu",
                               WindowControllerPropertyKey.windowLevelKey : NSWindow.Level.mainMenu])
        windowSettings.append([WindowControllerPropertyKey.nameKey        : ".statusBar",
                               WindowControllerPropertyKey.windowLevelKey : NSWindow.Level.statusBar])
        windowSettings.append([WindowControllerPropertyKey.nameKey        : ".popUpMenu",
                               WindowControllerPropertyKey.windowLevelKey : NSWindow.Level.popUpMenu])
        windowSettings.append([WindowControllerPropertyKey.nameKey        : ".screenSaver",
                               WindowControllerPropertyKey.windowLevelKey : NSWindow.Level.screenSaver])
        
        for windowSetting:Dictionary<String, Any> in windowSettings {
            let myWindowController = MyWindowController()

            myWindowController.showWindow(self)
            myWindowController.myWindow.title               = windowSetting[WindowControllerPropertyKey.nameKey] as! String
            myWindowController.windowLevelLabel.stringValue = windowSetting[WindowControllerPropertyKey.nameKey] as! String
            myWindowController.myWindow.level               = windowSetting[WindowControllerPropertyKey.windowLevelKey] as! NSWindow.Level
            
            myWindowControllerList.append(myWindowController)
        }
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    

}

