//
//  CreateCheckpointView.swift
//  TreasureHuntApp
//
//  Created by Vy on 29.12.20.
//

import SwiftUI
import MapKit

struct CreateCheckpointView: View {
    
    @ObservedObject var treasureHunt: TreasureHunt
    
    @State private var name: String = ""
    @State private var hint: String = ""
    @State private var latitude: String = "0.0"
    @State private var longitude: String = "0.0"
    
    @State private var putQuestion = false
    @State private var answer1 = false
    @State private var answer2 = false
    @State private var answer3 = false
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: UserLocation().userLatitude,
                                                                                  longitude: UserLocation().userLongitude),
                                                   span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    var body: some View {
        VStack {
            Text("Add a Checkpoint")
                .font(.system(size: 24, weight: .light))
                .padding()
            
            TextField("Name...", text: $name)
                .padding()
                .frame(height: 20, alignment: .leading)
            TextField("Description...", text: $hint)
                .padding()
                .frame(height: 100, alignment: Alignment.topLeading)
            TextField("Latitude...", text: $latitude)
                .padding()
            TextField("Longitude...", text: $longitude)
                .padding()
            // TODO: Change to tap on map
            // Map(coordinateRegion: $region)
            
            // Question feature disabled
            // TODO: Use Picker View
            Toggle(isOn: $putQuestion) {
                Label("Put a question", systemImage: "questionmark.circle")
            }.padding().disabled(true)
            if putQuestion {
                TextField("Question...", text: .constant(""))
                    .padding()
                HStack {
                    TextField("Answer 1...", text: .constant(""))
                    Toggle(isOn: $answer1) {
                        Label("", systemImage: "checkmark.circle")
                    }
                }
                HStack {
                    TextField("Answer 2...", text: .constant(""))
                    Toggle(isOn: $answer2) {
                        Label("", systemImage: "checkmark.circle")
                    }
                }
                HStack {
                    TextField("Answer 3...", text: .constant(""))
                    Toggle(isOn: $answer3) {
                        Label("", systemImage: "checkmark.circle")
                    }
                }
            }
            // Create Checkpoint
            Button(action: addCheckpointToHunt()) {
                Text("Create").modifyButton(backgroundColor: Color.init(#colorLiteral(red: 0.3084011078, green: 0.5618229508, blue: 0, alpha: 1)))
            }.padding()
        }
    }
    
    func addCheckpointToHunt() -> () -> Void {
        return {
            if Double(latitude) != nil, Double(longitude) != nil {
                let checkpoint = createCheckpoint()
                treasureHunt.checkpoints.append(checkpoint)
            } else {
                print("Not a valid number: \(latitude) and \(longitude)")
            }
        }
    }
    
    func createCheckpoint() -> Checkpoint {
        let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: Double(latitude)!, longitude: Double(longitude)!)
        return Checkpoint(name: name, hint: hint, coordinate: coordinate)
    }

}

struct CreateCheckpointView_Previews: PreviewProvider {
    static var previews: some View {
        CreateCheckpointView(treasureHunt: TreasureHunts().treasureHunts.first!)
    }
}
