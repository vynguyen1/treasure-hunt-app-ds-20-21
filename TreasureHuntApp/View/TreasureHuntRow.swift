//
//  TreasureHuntRow.swift
//  TreasureHuntApp
//
//  Created by Vy on 28.12.20.
//
import SwiftUI

struct TreasureHuntRow: View {
    
    @ObservedObject var treasureHunt: TreasureHunt
    
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
            Text(treasureHunt.description.count >= 100 ? treasureHunt.description.prefix(100) + "...":treasureHunt.description)
                .multilineTextAlignment(.leading)
                .padding([.top, .leading], 0)
                .font(.system(size: 16, weight: .light))
                .frame(height: 70, alignment: .topLeading)
        }
    }
}
