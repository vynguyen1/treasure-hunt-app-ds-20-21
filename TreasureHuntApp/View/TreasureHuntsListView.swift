//
//  TreasureHuntListView.swift
//  TreasureHuntApp
//
//  Created by Vy on 28.12.20.
//

import SwiftUI

struct TreasureHuntsListView: View {
    
    @FetchRequest(
        entity: TreasureHunt.entity(),
        sortDescriptors: []
    )
    var treasureHunts: FetchedResults<TreasureHunt>
    
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        VStack {
            List {
                ForEach(treasureHunts, id: \.uuid) { treasureHunt in
                    NavigationLink(destination: DetailedHuntView(treasureHunt: treasureHunt).environment(\.managedObjectContext, self.viewContext)) {
                        TreasureHuntRow(treasureHunt: treasureHunt)
                    }
                }.onDelete(perform: deleteTreasureHunt)
            }.listStyle(InsetGroupedListStyle())
            
            NavigationLink(destination: CreateTreasureHuntView()) {
                Image(systemName: "plus.circle")
                    .modifyButton(backgroundColor: Color.init(#colorLiteral(red: 0.3084011078, green: 0.5618229508, blue: 0, alpha: 1)))
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }.padding()
        }.navigationBarTitle("Treasure Hunts", displayMode: .inline)
    }

    func deleteTreasureHunt(at offsets: IndexSet) {
        for index in offsets {
            viewContext.delete(treasureHunts[index])
        }
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct TreasureHuntListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = PersistenceController.preview.container.viewContext
        return TreasureHuntsListView().environment(\.managedObjectContext, viewContext)
    }
}
