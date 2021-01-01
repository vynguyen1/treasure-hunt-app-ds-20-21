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
        //NavigationView {
        
            VStack {
                List(treasureHunts, id: \.id) { treasueHunt in
                    NavigationLink(destination: DetailedHuntView(treasureHunt: treasueHunt)) {
                        TreasureHuntRow(treasureHunt: treasueHunt)
                    }
                }.listStyle(InsetGroupedListStyle())
                
                NavigationLink(
                    destination: CreateTreasureHuntView(treasureHunt: TreasureHunt("", "", [Checkpoint](), false, false))) {
                    Image(systemName: "plus.circle")
                        .padding()
                        .frame(width: 130, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .background(Color.init(#colorLiteral(red: 0.3084011078, green: 0.5618229508, blue: 0, alpha: 1)))
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }.padding()
            }.navigationBarTitle("Treasure Hunts", displayMode: .inline)
        //}
    }
}

struct TreasureHuntListView_Previews: PreviewProvider {
    static var previews: some View {
        TreasureHuntsListView()
    }
}
