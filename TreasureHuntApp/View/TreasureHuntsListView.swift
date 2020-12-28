//
//  TreasureHuntListView.swift
//  TreasureHuntApp
//
//  Created by Vy on 28.12.20.
//

import SwiftUI

struct TreasureHuntsListView: View {
    
    @State private var treasureHunts = TreasureHunt.getTreasureHunts()
    
    var body: some View {
        VStack {
            Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Button")/*@END_MENU_TOKEN@*/
            }
            Text("Treasure Hunts")
            List(treasureHunts) {
                treasueHunt in TreasureHuntRow(treasureHunt: treasueHunt)
            }
        }
    }
}

struct TreasureHuntListView_Previews: PreviewProvider {
    static var previews: some View {
        TreasureHuntsListView()
    }
}
