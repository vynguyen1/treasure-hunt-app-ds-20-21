//
//  ContentView.swift
//  TreasureHuntApp
//
//  Created by Vy on 26.12.20.
//

import MapKit
import SwiftUI

struct MapView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: UserLocation().userLatitude, longitude: UserLocation().userLongitude), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    @State private var trackingMode = MapUserTrackingMode.follow
    
    @State private var messageText:String = "You're getting closer!"
    
    @State var locations:[Checkpoint]
    
    @ObservedObject var userLocation = UserLocation() {
        didSet {
            if LocationComponent.checkpointHasBeenReached() {
                LocationComponent.getCurrentCheckpoint()!.checked = true
                print("Checkpoint has been reached")
                // insert popup message
                // update hint and current checkpoint
            }
        }
    }
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region,
                interactionModes: .all,
                showsUserLocation: true,
                userTrackingMode: $trackingMode,
                annotationItems: locations,
                annotationContent: {loc in MapMarker(coordinate: loc.coordinate, tint: .blue)})
            Divider()
            Text("Your Location").font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
            Text("Latitude: \(userLocation.userLatitude)\nLongitude: \(userLocation.userLongitude)")
                .multilineTextAlignment(.center)
            Text(messageText).padding()
            Menu("Menu") {
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Label("Go back", systemImage: "arrow.backward")
                }
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Label("Menu Item 1", systemImage: "scribble")
                }
            }
            .frame(width: 120, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .foregroundColor(.white)
            .background(Color.init(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
            .cornerRadius(10.0)
            Button(action: {
                if LocationComponent.checkpointHasBeenReached() {
                    LocationComponent.getCurrentCheckpoint()!.checked = true
                    print("Checkpoint has been reached")
                } else {
                    print("Not quite there yet!")
                }
            }) {
                Text("Test")
            }
            Divider()
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        let locations = TreasureHunt.getTreasureHunts()[0].checkpoints.filter {$0.checked}
        MapView(locations: locations)
    }
}
