//
//  spectrumApp.swift
//  spectrum
//
//  Created by Ian Pedeglorio on 2023-09-03.
//
import FirebaseCore
import SwiftUI

@main
struct spectrumApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
