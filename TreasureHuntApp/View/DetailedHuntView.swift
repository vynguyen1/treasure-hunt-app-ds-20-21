//
//  DetailedHuntView.swift
//  TreasureHuntApp
//
//  Created by Vy on 28.12.20.
//

import MapKit
import SwiftUI

struct DetailedHuntView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var treasureHunt: TreasureHunt
    
    @State var userLocation = UserLocation()
    
    var body: some View {
        VStack {
            Image("andrew-neel-unsplash").resizable()
                .frame(height: 200.0, alignment: .leading)
            Section {
                Text(treasureHunt.name)
                    .padding()
                    .font(.system(size: 28, weight: .light))
                Text(treasureHunt.huntDescription)
                    .padding()
            }
            Form {
                Section(header: Text("Checkpoints")) {
                    List(Array(treasureHunt.checkpoints!).sorted(by: { $0.rank < $1.rank }), id: \.self) { checkpoint in
                        CheckpointRow(checkpoint: checkpoint)
                    }
                }
            }
            HStack {
                NavigationLink(destination: MapView(
                                treasureHunt: treasureHunt, userLocation: userLocation)
                                .environment(\.managedObjectContext, self.viewContext)) {
                    Text((treasureHunt.inProgress && !treasureHunt.finished) ? "Continue" : "Start").modifyButton(backgroundColor: Color.init(#colorLiteral(red: 0.3084011078, green: 0.5618229508, blue: 0, alpha: 1)))
                }

                NavigationLink(destination: EditTreasureHuntView(
                                treasureHunt: treasureHunt,
                                name: treasureHunt.name,
                                huntDescription: treasureHunt.huntDescription,
                                checkpoints: CheckpointCreateModel.checkpointsToCreateModels(Array(treasureHunt.checkpoints! as Set)))
                        .environment(\.managedObjectContext, self.viewContext)) {
                    Text("Edit").modifyButton(backgroundColor: Color.init(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
                }
            }
            Divider()
        }
    }
}

struct DetailedHuntView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = PersistenceController.preview.container.viewContext
        let treasureHunt = PersistenceController.createTreasureHuntForPreview(viewContext: viewContext)
        DetailedHuntView(treasureHunt: treasureHunt).environment(\.managedObjectContext, viewContext)
    }
}
