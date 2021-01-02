//
//  ContentView.swift
//  TreasureHuntApp
//
//  Created by Vy on 26.12.20.
//

import MapKit
import SwiftUI

struct MapView: View {
    
    private let errorThreshold: Double = 0.0002
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    @State private var trackingMode = MapUserTrackingMode.follow
    
    @State private var messageText:String = ""
    @State private var hintText:String = ""
    
    @ObservedObject var treasureHunt: TreasureHunt
    @ObservedObject var treasureHunts: TreasureHunts
    
    private let treasureHuntIndex: Int
    @State private var finished: Bool = false
    
    @ObservedObject var userLocation = UserLocation()
    
    var body: some View {
        ZStack {
            VStack {
                Map(coordinateRegion: $region,
                    interactionModes: .all,
                    showsUserLocation: true,
                    userTrackingMode: $trackingMode,
                    annotationItems: treasureHunt.checkpoints.filter {$0.checked == true},
                    annotationContent: {loc in MapMarker(coordinate: loc.coordinate, tint: .blue)})
                Divider()
                Text("\(treasureHunt.checkpoints.filter{$0.checked == true}.count)/\(treasureHunt.checkpoints.count)")
                if !finished {
                    Text("Your Location").font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                    Text("Latitude: \(userLocation.userLatitude)\nLongitude: \(userLocation.userLongitude)")
                        .multilineTextAlignment(.center)
                }
                Text(messageText).padding()
    //            Menu("Menu") {
    //                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
    //                    Label("Go back", systemImage: "arrow.backward")
    //                }
    //                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
    //                    Label("Menu Item 1", systemImage: "scribble")
    //                }
    //            }
    //            .frame(width: 120, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    //            .foregroundColor(.white)
    //            .background(Color.init(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
    //            .cornerRadius(10.0)
                if !finished {
                    Button(action: updateCheckpoint()) {
                        Text("Check location")
                    }
                    Divider()
                }
            }
            if finished {
                Text("Congratulations!!\nYou’ve reached the goal! Hope you’ve enjoyed this little adventure :)")
                    .frame(width: UIScreen.main.bounds.width-20, height: 300)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                    .background(Color.init(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
                    .foregroundColor(.white)
            }
        }
        //.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
    
    func updateCheckpoint() -> () -> () {
        return {
            if checkpointHasBeenReached() {
                treasureHunt.checkpoints.filter {
                    $0.id == getCurrentCheckpoint()!.id
                }.first!.checked = true
                treasureHunts.treasureHunts[treasureHuntIndex] = treasureHunt
                messageText = "Checkpoint has been reached."
            } else {
                messageText = "Not quite there yet!"
            }
            finished = isFinished()
            if finished {
                messageText = "Finished!"
                treasureHunt.finished = true
                treasureHunt.inProgress = false
                treasureHunts.treasureHunts[treasureHuntIndex] = treasureHunt
            }
        }
    }
    
    func checkpointHasBeenReached() -> Bool {
        let checkpointLocation = getLocationOfCurrentCheckpoint()
        print(checkpointLocation)
        return (abs(userLocation.userLatitude - checkpointLocation.latitude) <= errorThreshold) && (abs(userLocation.userLongitude - checkpointLocation.longitude) <= errorThreshold)
    }

    func getLocationOfCurrentCheckpoint() -> CLLocationCoordinate2D {
        let currentCheckpoint = getCurrentCheckpoint()
        if currentCheckpoint != nil {
            print(currentCheckpoint!)
            return currentCheckpoint!.coordinate
        } else {
            return CLLocationCoordinate2D()
        }
    }
    
    func getCurrentCheckpoint() -> Checkpoint? {
        return treasureHunt.checkpoints.filter { checkpoint in
            return checkpoint.checked == false
        }.first
    }
    
    init(treasureHunt: TreasureHunt, treasureHuntId: UUID, treasureHunts: TreasureHunts) {
        self.treasureHunt = treasureHunt
        if treasureHunt.finished == false && treasureHunt.inProgress == false {
            treasureHunt.inProgress = true
        }
        self.treasureHuntIndex = treasureHunts.treasureHunts.firstIndex(where: { (item) -> Bool in
            item.id == treasureHuntId
        })!
        self.treasureHunts = treasureHunts
        self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: self.userLocation.userLatitude, longitude: self.userLocation.userLongitude), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        if let checkpoint = getCurrentCheckpoint() {
            self.hintText = checkpoint.hint
        }
        self.finished = isFinished()
    }
    
    func isFinished() -> Bool {
        return treasureHunt.checkpoints.count == treasureHunt.checkpoints.filter {$0.checked == true}.count
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        let treasureHunts = TreasureHunts()
        let treasureHunt = treasureHunts.treasureHunts.first!
        MapView(treasureHunt: treasureHunt, treasureHuntId: treasureHunt.id, treasureHunts: treasureHunts)
    }
}
