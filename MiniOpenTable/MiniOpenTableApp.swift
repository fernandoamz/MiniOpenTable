//
//  MiniOpenTableApp.swift
//  MiniOpenTable
//
//  Created by Fernando Amezcua Alcantar on 15/07/25.
//

import SwiftUI
import Inject

@main
struct MiniOpenTableApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
          ContentView().enableInjection()
        }
    }
}
