//
//  ContentView.swift
//  TreasureHuntApp
//
//  Created by Vy on 26.12.20.
//

import MapKit
import SwiftUI

struct MapView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    @State var showFinishedSheet = false
    
    private let errorThreshold: Double = 0.001
    let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    
    @State private var finished: Bool = false
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(
        latitude: 52.520008, longitude: 13.404954), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    @State private var trackingMode = MapUserTrackingMode.follow
    
    @State private var messageText: String = ""
    @State private var hintText: String = ""
    @State private var hintHeadline: String = "Hint:"
    
    @ObservedObject var treasureHunt: TreasureHunt
    @ObservedObject var userLocation: UserLocation
    
    var body: some View {
        ZStack {
            VStack {
                Map(coordinateRegion: $region,
                    interactionModes: .all,
                    showsUserLocation: true,
                    userTrackingMode: $trackingMode,
                    annotationItems: treasureHunt.checkpoints?.filter {($0.checked == true)} ?? [],
                    annotationContent: { loc in
                        MapMarker(coordinate: CLLocationCoordinate2D(latitude: loc.locationLatitude, longitude: loc.locationLongitude),
                                  tint: .blue)
                    })
                    .onDisappear(perform: {
                        self.timer.upstream.connect().cancel()
                    })
                Divider()
                Text("""
                        Checkpoints completed:
                        \(treasureHunt.checkpoints?.filter {$0.checked == true}.count ?? 0)/\(treasureHunt.checkpoints?.count ?? 0)
                    """)
                    .onReceive(timer) { _ in
                        updateCheckpoint()()
                        if self.finished == true {
                            self.timer.upstream.connect().cancel()
                        }
                }
                if !self.finished {
                    Text(hintHeadline).font(.title3)
                    Text(hintText)
                }
                Divider()
                Text(messageText).padding()
            }
        }
        .sheet(isPresented: $showFinishedSheet) {
            FinishedView(name: treasureHunt.name)
        }
        .navigationTitle(treasureHunt.name)
    }

    func updateCheckpoint() -> () -> Void {
        return {
            self.finished = isFinished()
            if !self.finished {
                if checkpointHasBeenReached() {
                    viewContext.performAndWait {
                        treasureHunt.checkpoints!.filter {
                            $0.id == getCurrentCheckpoint()!.id
                        }.first!.checked = true
                        try? viewContext.save()
                    }
                    messageText = "Checkpoint has been reached."
                } else {
                    messageText = "Not quite there yet!"
                    hintText = getCurrentCheckpoint()?.hint ?? ""
                }
            } else {
                messageText = "Finished!"
                hintHeadline = ""
                hintText = ""
                if finished && treasureHunt.inProgress {
                    showFinishedSheet = true
                }
                viewContext.performAndWait {
                    treasureHunt.setValue(true, forKey: "finished")
                    treasureHunt.setValue(false, forKey: "inProgress")
                    try? viewContext.save()
                }
            }
        }
    }

    func checkpointHasBeenReached() -> Bool {
        let checkpointLocation = getLocationOfCurrentCheckpoint()
        print(checkpointLocation)
        return (abs(userLocation.userLatitude - checkpointLocation.latitude) <= errorThreshold)
            && (abs(userLocation.userLongitude - checkpointLocation.longitude) <= errorThreshold)
    }

    func getLocationOfCurrentCheckpoint() -> CLLocationCoordinate2D {
        let currentCheckpointOpt = getCurrentCheckpoint()
        if let currentCheckpoint = currentCheckpointOpt {
            print("\(userLocation.userLatitude), \(userLocation.userLongitude)")
            return CLLocationCoordinate2D(latitude: currentCheckpoint.locationLatitude, longitude: currentCheckpoint.locationLongitude)
        } else {
            return CLLocationCoordinate2D()
        }
    }

    func getCurrentCheckpoint() -> Checkpoint? {
        return treasureHunt.checkpoints!
            .sorted(by: { $0.rank < $1.rank })
            .filter { checkpoint in
                return checkpoint.checked == false
            }
            .first
    }

    init(treasureHunt: TreasureHunt, userLocation: UserLocation) {
        self.treasureHunt = treasureHunt
        self.userLocation = userLocation
        self.region = // State(initialValue:
                                MKCoordinateRegion(center: CLLocationCoordinate2D(
            latitude: userLocation.userLatitude, longitude: userLocation.userLongitude),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)) // )
        // self.region = region
        if treasureHunt.finished == false && treasureHunt.inProgress == false {
            treasureHunt.setValue(true, forKey: "inProgress")
            try? viewContext.save()
        }
        if let checkpoint = getCurrentCheckpoint() {
            self.hintText = checkpoint.hint
        }
        self.finished = isFinished()
    }

    func isFinished() -> Bool {
        return treasureHunt.checkpoints!.count == treasureHunt.checkpoints!.filter {$0.checked == true}.count
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = PersistenceController.preview.container.viewContext
        let treasureHunt = PersistenceController.createTreasureHuntForPreview(viewContext: viewContext)
        let userLocation = UserLocation()
//        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 52.520008, longitude: 13.404954),
//                                            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        MapView(treasureHunt: treasureHunt, userLocation: userLocation).environment(\.managedObjectContext, viewContext)
    }
}
