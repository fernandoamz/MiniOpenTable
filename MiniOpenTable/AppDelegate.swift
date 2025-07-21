//
//  AppDelegate.swift
//  
//
//  Created by Fernando Amezcua Alcantar on 21/07/25.
//

import UIKit
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        if FirebaseApp.app() != nil {
            print("✅ Firebase successfully connected.")
        } else {
            print("❌ Firebase failed to connect.")
        }
        
        return true
    }
}
