//
//  CreateCheckpointView.swift
//  TreasureHuntApp
//
//  Created by Vy on 29.12.20.
//

import SwiftUI
import MapKit

struct CreateCheckpointView: View {
    
    @Environment (\.presentationMode) var presentationMode
    
    @Binding var checkpoints: [CheckpointCreateModel]
    
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
            TextField("Add a hint...", text: $hint)
                .padding()
                .frame(height: 100, alignment: Alignment.topLeading)
            TextField("Latitude...", text: $latitude)
                .padding()
            TextField("Longitude...", text: $longitude)
                .padding()
            // TODO: Nice-to-have: Change to tap on map: Map(coordinateRegion: $region)
            // TODO: Nice-to-have: Question feature (Use Picker View)
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
            Button(action: createCheckpointCreateModel) {
                Text("Create").modifyButton(backgroundColor: Color.init(#colorLiteral(red: 0.3084011078, green: 0.5618229508, blue: 0, alpha: 1)))
            }.padding()
        }
    }
    
//    func addCheckpointToHunt() -> () -> Void {
//        return {
//            if Double(latitude) != nil, Double(longitude) != nil {
//                let checkpoint = createCheckpoint()
//                treasureHunt.checkpoints.append(checkpoint)
//            } else {
//                print("Not a valid number: \(latitude) and \(longitude)")
//            }
//        }
//    }
    
    func createCheckpointCreateModel() {
        if let locationLatitude = Double(latitude), let locationLongitude = Double(longitude) {
            let checkpointCreateModel = CheckpointCreateModel(
                uuid: UUID(), name: name, hint: hint, locationLatitude: locationLatitude, locationLongitude: locationLongitude)
            checkpoints.append(checkpointCreateModel)
            presentationMode.wrappedValue.dismiss()
        }
    }

}

struct CreateCheckpointView_Previews: PreviewProvider {
    static var previews: some View {
        CreateCheckpointView(checkpoints: .constant([]))
    }
}
