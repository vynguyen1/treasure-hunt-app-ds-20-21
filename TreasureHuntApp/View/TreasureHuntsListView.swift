//
//  TreasureHuntListView.swift
//  TreasureHuntApp
//
//  Created by Vy on 28.12.20.
//

import SwiftUI
import MapKit

struct TreasureHuntsListView: View {
    
    @ObservedObject var treasureHunts = TreasureHunts()
    
    var body: some View {
        VStack {
            List {
                ForEach(treasureHunts.treasureHunts, id: \.id) { treasueHunt in
                    NavigationLink(destination: DetailedHuntView(treasureHunt: treasueHunt, treasureHunts: treasureHunts)) {
                        TreasureHuntRow(treasureHunt: treasueHunt)
                    }
                }.onDelete(perform: deleteTreasureHunt)
            }.listStyle(InsetGroupedListStyle())
            
            NavigationLink(
                destination: CreateTreasureHuntView(
                    treasureHunt: TreasureHunt(name: "", description: "", checkpoints: [Checkpoint]()), treasureHunts: treasureHunts)) {
                Image(systemName: "plus.circle")
                    .modifyButton(backgroundColor: Color.init(#colorLiteral(red: 0.3084011078, green: 0.5618229508, blue: 0, alpha: 1)))
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }.padding()
        }.navigationBarTitle("Treasure Hunts", displayMode: .inline)
    }

    func deleteTreasureHunt(at offsets: IndexSet) {
        treasureHunts.treasureHunts.remove(atOffsets: offsets)
        print(treasureHunts.treasureHunts.count)
        print("Delete Hunts with id: \(offsets)")
    }
}

struct TreasureHuntListView_Previews: PreviewProvider {
    static var previews: some View {
        TreasureHuntsListView()
    }
}
