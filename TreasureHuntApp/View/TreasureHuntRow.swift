//
//  TreasureHuntRow.swift
//  TreasureHuntApp
//
//  Created by Vy on 28.12.20.
//
import SwiftUI

struct TreasureHuntRow: View {
    
    @State var treasureHunt: TreasureHunt
    
    var body: some View {
        VStack {
            HStack {
                Text(treasureHunt.name)
                    .font(.system(size: 18))
                Spacer()
                Image(systemName: "leaf.fill").overlay(
                    Circle().stroke(Color.green, lineWidth: 1)
                )
            }
            Text(treasureHunt.huntDescription.count >= 100 ? treasureHunt.huntDescription.prefix(100) + "...":treasureHunt.huntDescription)
                .multilineTextAlignment(.leading)
                .padding([.top, .leading], 0)
                .font(.system(size: 16, weight: .light))
                .frame(height: 70, alignment: .topLeading)
        }
    }
}
