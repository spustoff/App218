//
//  App218App.swift
//  App218
//
//  Created by IGOR on 10/10/2023.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: "app_BGcMkRTzm1qsaQkNvE6rAyTDQRKCEC")
        Amplitude.instance().initializeApiKey("f12e9b63af37fde9d529e2053349495a")

        FirebaseApp.configure()
        
        return true
    }
}

@main
struct App218App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
