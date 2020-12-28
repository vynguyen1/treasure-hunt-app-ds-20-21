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
    
    // Bramsche
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 52.399013, longitude: 8.005578), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    @State private var locations = TreasureHunt.getTreasureHunts()[0].checkpoints//.map {$0.coordinate}
    
    @State private var trackingMode = MapUserTrackingMode.follow
    
    @ObservedObject var userLocation = UserLocation()
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: $trackingMode, annotationItems: locations, annotationContent: {loc in MapMarker(coordinate: loc.coordinate, tint: .blue)})
            Divider()
            Text("Your Location\nLatitude: \(userLocation.userLatitude)\nLongitude: \(userLocation.userLongitude)")
                .multilineTextAlignment(.center)
            Text("You're getting closer!")
                        Menu("Menu") {
                Text("Go back")
                Text("Menu Item 1")
            }
        }

//        Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: $trackingMode, annotationItems: locations) {loc in MapAnnotation(
//                            coordinate: loc.coordinate,
//                            anchorPoint: CGPoint(x: 0.5, y: 0.5)
//                        ) {
//                            Circle()
//                                .stroke(Color.green)
//                                .frame(width: 44, height: 44)
//                        }
//
//        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
