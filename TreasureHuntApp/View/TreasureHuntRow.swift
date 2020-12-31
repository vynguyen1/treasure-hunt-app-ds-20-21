//
//  TreasureHuntRow.swift
//  TreasureHuntApp
//
//  Created by Vy on 28.12.20.
//
import SwiftUI

struct TreasureHuntRow: View {
    
    var treasureHunt: TreasureHunt
    
    var body: some View {
        Button(action: {}) {
            Label(treasureHunt.name, systemImage: "leaf.fill")
                .font(.system(size: 18))
            if treasureHunt.description.count >= 40 {
                Text(treasureHunt.description.prefix(40)+"...")
                    .font(.system(size: 16, weight: .light))
            } else {
                Text(treasureHunt.description)
                    .font(.system(size: 16, weight: .light))
            }
        }
    }
}
