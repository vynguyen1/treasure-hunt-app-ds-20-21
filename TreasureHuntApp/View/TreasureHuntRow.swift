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
        Label(treasureHunt.name, systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/)
    }
}
