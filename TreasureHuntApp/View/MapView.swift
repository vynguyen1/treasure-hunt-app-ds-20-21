//
//  ContentView.swift
//  TreasureHuntApp
//
//  Created by Vy on 26.12.20.
//

import MapKit
import SwiftUI

struct MapView: View {
    
    // Default region (Berlin coordinates)
//    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 52.520008, longitude: 13.404954), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    // Default region (Bramsche coordinates)
//    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 52.399013, longitude: 8.005578), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: UserLocation().userLatitude, longitude: UserLocation().userLongitude), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    @State private var locations = TreasureHunt.getTreasureHunts()[0].checkpoints.filter {$0.checked}
    
    @State private var trackingMode = MapUserTrackingMode.follow
    
    @ObservedObject var userLocation = UserLocation() {
        didSet {
            if LocationComponent.checkpointHasBeenReached() {
                LocationComponent.getCurrentCheckpoint()!.checked = true
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
            Text("You're getting closer!").padding()
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
            Divider()
        }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)

//        Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: $trackingMode, annotationItems: locations) {loc in MapAnnotation(coordinate: loc.coordinate, anchorPoint: CGPoint(x: 0.5, y: 0.5)) {
//                Circle().stroke(Color.green)
//                        .frame(width: 44, height: 44)
//            }
//        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
