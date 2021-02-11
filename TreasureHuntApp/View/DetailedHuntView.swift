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
    // @ObservedObject var treasureHunts: TreasureHunts
    
    @State var userLocation = UserLocation()
    
    var body: some View {
        VStack {
            Image("andrew-neel-unsplash").resizable()
                // .scaledToFit()
                .frame(height: 200.0, alignment: .leading)
            Text(treasureHunt.name)
                .padding()
                .font(.system(size: 28, weight: .light))
            
            Text(treasureHunt.huntDescription)
                .padding()
            Text("Checkpoints:")
                .font(.system(size: 18, weight: .light))
            List(Array(treasureHunt.checkpoints!), id: \.self) { checkpoint in
                CheckpointRow(checkpoint: checkpoint)
            }
            // Start/Continue Hunt
            HStack {
                NavigationLink(destination: MapView(
                                treasureHunt: treasureHunt, userLocation: userLocation, region: getDefaultRegion())
                                .environment(\.managedObjectContext, self.viewContext)) {
                    Text(!(treasureHunt.inProgress && treasureHunt.finished) ? "Start" : "Continue").modifyButton(backgroundColor: Color.init(#colorLiteral(red: 0.3084011078, green: 0.5618229508, blue: 0, alpha: 1)))
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
    
    private func getDefaultRegion() -> MKCoordinateRegion {
        return MKCoordinateRegion(center: CLLocationCoordinate2D(
            latitude: userLocation.userLatitude, longitude: userLocation.userLongitude),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    }
}

struct DetailedHuntView_Previews: PreviewProvider {
    static var previews: some View {
        // let treasureHunts = TreasureHunts()
        // let treasureHunt = treasureHunts.treasureHunts.first!
        let viewContext = PersistenceController.preview.container.viewContext
        let treasureHunt = PersistenceController.createTreasureHuntForPreview(viewContext: viewContext)
        DetailedHuntView(treasureHunt: treasureHunt).environment(\.managedObjectContext, viewContext)
    }
}
