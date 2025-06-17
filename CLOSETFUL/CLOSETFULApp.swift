//
//  CLOSETFULApp.swift
//  CLOSETFUL
//
//  Created by 김소정 on 6/17/25.
//

import SwiftUI

@main
struct CLOSETFULApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
