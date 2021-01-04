//
//  TreasureHuntAppApp.swift
//  TreasureHuntApp
//
//  Created by Vy on 26.12.20.
//

import SwiftUI

@main
struct TreasureHuntAppApp: App {
    var body: some Scene {
        WindowGroup {
            StartView()
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
