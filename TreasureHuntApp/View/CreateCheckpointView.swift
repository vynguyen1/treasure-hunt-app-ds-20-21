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
    @State private var latitude: String = ""
    @State private var longitude: String = ""
    
    // TODO: Nice-to-have: Question feature (below variables not used yet)
    @State private var putQuestion = false
    @State private var answer1 = false
    @State private var answer2 = false
    @State private var answer3 = false
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: UserLocation().userLatitude,
                                                                                  longitude: UserLocation().userLongitude),
                                                   span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Details")) {
                    TextField("Name...", text: $name, onCommit: {
                        UIApplication.shared.endEditing()
                    })
                        .padding()
                        .frame(height: 20, alignment: .leading)
                    TextField("Add a hint...", text: $hint, onCommit: {
                        UIApplication.shared.endEditing()
                    })
                        .padding()
                        .frame(height: 80, alignment: Alignment.topLeading)
                }
                Section(header: Text("Coordinates")) {
                    // TODO: Nice-to-have: Change to tap on map: Map(coordinateRegion: $region)
                    TextField("Latitude...", text: $latitude, onCommit: {
                        UIApplication.shared.endEditing()
                    })
                        .padding()
                    TextField("Longitude...", text: $longitude, onCommit: {
                        UIApplication.shared.endEditing()
                    })
                        .padding()
                }
                
                Section {
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
                }.hidden()
            }
            Button(action: createCheckpointCreateModel) {
                Text("Create").modifyButton(backgroundColor: Color.init(#colorLiteral(red: 0.3084011078, green: 0.5618229508, blue: 0, alpha: 1)))
            }.padding()
        }.navigationTitle("Add a Checkpoint")
    }
    
    func createCheckpointCreateModel() {
        if let locationLatitude = Double(latitude), let locationLongitude = Double(longitude) {
            let checkpointCreateModel = CheckpointCreateModel(uuid: UUID(), name: name, hint: hint,
                  locationLatitude: locationLatitude, locationLongitude: locationLongitude, rank: (checkpoints.count))
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
