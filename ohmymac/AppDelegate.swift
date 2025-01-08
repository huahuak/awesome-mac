//
//  AppDelegate.swift
//  WindowActionCallback
//
//  Created by huahua on 2023/8/23.
//

import Cocoa
import Foundation
import UserNotifications
import IOKit.pwr_mgt

class AppDelegate: NSObject, NSApplicationDelegate, NSWindowDelegate {
    
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        requestAccessibilityPermission()
        setupCrashHandler()
        startShortcut()
        startWindowMenuManager()
        startScreenTimeReminder(interval: 3600)
        startAirpodsService()
        NSApp.setActivationPolicy(.accessory)
        NSApp.activate(ignoringOtherApps: true)
    }
    
    func applicationWillFinishLaunching(_ notification: Notification) {
        registryNotificationCenter()
    }
    
    
    // MARK: function
    func requestAccessibilityPermission() {
        let options = [kAXTrustedCheckOptionPrompt.takeRetainedValue() as String: true]
        let trusted = AXIsProcessTrustedWithOptions(options as CFDictionary)
        if trusted {
            debugPrint("Accessibility permission granted.")
        } else {
            debugPrint("Accessibility permission denied.")
            // @todo send a notification
            exit(ErrCode.NoPermission)
        }
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge]) { granted, error in
            if granted {
                debugPrint("Notification authorization granted")
            } else {
                debugPrint("Notification authorization denied")
            }
        }
    }
    
    func setupCrashHandler() {
        NSSetUncaughtExceptionHandler { exception in
            notify(msg: "\(exception.callStackSymbols.joined(separator: "\n"))")
        }
    }
}
