//
//  TreasureHuntAppApp.swift
//  TreasureHuntApp
//
//  Created by Vy on 26.12.20.
//

import SwiftUI

@main
struct TreasureHuntAppApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            StartView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
