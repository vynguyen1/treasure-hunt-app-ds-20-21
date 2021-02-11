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
    
    private let errorThreshold: Double = 0.001 // 0.0002
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    // private let treasureHuntIndex: Int
    
    @State private var finished: Bool = false
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(
        latitude: 52.520008, longitude: 13.404954), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    @State private var trackingMode = MapUserTrackingMode.follow
    
    @State private var messageText: String = ""
    @State private var hintText: String = ""
    
    @ObservedObject var treasureHunt: TreasureHunt
    @ObservedObject var userLocation: UserLocation
    
    var body: some View {
        ZStack {
            VStack {
                Map(coordinateRegion: $region,
                    interactionModes: .all,
                    showsUserLocation: true,
                    userTrackingMode: $trackingMode,
                    annotationItems: treasureHunt.checkpoints?.filter {$0.checked == true} ?? [],
                    annotationContent: { loc in
                        MapMarker(coordinate: CLLocationCoordinate2D(latitude: loc.locationLatitude, longitude: loc.locationLongitude),
                                  tint: .blue)
                    })
                    .onDisappear(perform: {
                        self.timer.upstream.connect().cancel()
                    })
                Divider()
                Text("\(treasureHunt.checkpoints?.filter {$0.checked == true}.count ?? 0)/\(treasureHunt.checkpoints?.count ?? 0)")
                    .onReceive(timer) { _ in
                        updateCheckpoint()()
                        if finished == true {
                            self.timer.upstream.connect().cancel()
                        }
                }
                if !self.finished {
                    Text("Your Location").font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                    Text("Latitude: \(userLocation.userLatitude)\nLongitude: \(userLocation.userLongitude)")
                        .multilineTextAlignment(.center)
                }
                Text(messageText).padding()
            }
            if self.finished {
                Text("Congratulations!!\nYou’ve reached the goal! Hope you’ve enjoyed this little adventure :)")
                    .frame(width: UIScreen.main.bounds.width-20, height: 300)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                    .background(Color.init(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
                    .foregroundColor(.white)
            }
        }// .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }

    func updateCheckpoint() -> () -> Void {
        return {
            if checkpointHasBeenReached() {
                viewContext.performAndWait {
                    treasureHunt.checkpoints!.filter {
                        $0.id == getCurrentCheckpoint()!.id
                    }.first!.checked = true
                    try? viewContext.save()
                }
                // treasureHunts.treasureHunts[treasureHuntIndex] = treasureHunt
                messageText = "Checkpoint has been reached."
            } else {
                messageText = "Not quite there yet!"
            }
            self.finished = isFinished()
            if self.finished {
                messageText = "Finished!"
                viewContext.performAndWait {
                    treasureHunt.setValue(true, forKey: "finished")
                    treasureHunt.setValue(false, forKey: "inProgress")
                    try? viewContext.save()
                }
                // treasureHunts.treasureHunts[treasureHuntIndex] = treasureHunt
            }
            //try? viewContext.save()
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
        return treasureHunt.checkpoints!.filter { checkpoint in
            return checkpoint.checked == false
        }.first
    }

    init(treasureHunt: TreasureHunt, userLocation: UserLocation, region: MKCoordinateRegion) {
        self.treasureHunt = treasureHunt
        self.userLocation = userLocation
        self.region = region
        if treasureHunt.finished == false && treasureHunt.inProgress == false {
            treasureHunt.setValue(true, forKey: "inProgress")
            try? viewContext.save()
        }
//        self.treasureHuntIndex = treasureHunts.treasureHunts.firstIndex(where: { (item) -> Bool in
//            item.uuid == treasureHuntId
//        })!
//        self.treasureHunts = treasureHunts
//        _region = State(initialValue: MKCoordinateRegion(center: CLLocationCoordinate2D(
//            latitude: userLocation.userLatitude, longitude: userLocation.userLongitude),
//            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)))
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
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 52.520008, longitude: 13.404954),
                                            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        MapView(treasureHunt: treasureHunt, userLocation: userLocation, region: region).environment(\.managedObjectContext, viewContext)
    }
}
