//
//  CreateCheckpointView.swift
//  TreasureHuntApp
//
//  Created by Vy on 29.12.20.
//

import SwiftUI
import MapKit

struct CreateCheckpointView: View {
    
    @State private var putQuestion = false
    @State private var answer1 = false
    @State private var answer2 = false
    @State private var answer3 = false
    
    // Default region (Berlin coordinates)
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: UserLocation().userLatitude, longitude: UserLocation().userLongitude), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    var body: some View {
        VStack {
            //TODO: Navigation vereinheitlichen und überall gleich machen -> als View auslagern
            HStack {
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "arrow.backward")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .frame(width: 40, height: 30, alignment: .topLeading)
                }.padding(.top, 5)
                .padding(.leading, 10)//EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 0))
                Spacer()
            }
            Text("Add a Checkpoint")
                .font(.system(size: 24, weight: .light))
                .padding()
            
            
            TextField("Name...", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .padding()
                .frame(height: 20, alignment: .leading)
            TextField("Description...", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .padding()
                .frame(height: 100, alignment: Alignment.topLeading)
            TextField("Latitude...", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .padding()
            TextField("Longitude...", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .padding()
            //TODO: Change to tap on map
            //Map(coordinateRegion: $region)
            
            // Question feature disabled
            //TODO: Use Picker View
            Toggle(isOn: $putQuestion) {
                Label("Put a question", systemImage: "questionmark.circle")
            }.padding().disabled(true)
            if putQuestion {
                TextField("Question...", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .padding()
                HStack {
                    TextField("Answer 1...", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    Toggle(isOn: $answer1) {
                        Label("", systemImage: "checkmark.circle")
                    }
                }
                HStack {
                    TextField("Answer 2...", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    Toggle(isOn: $answer2) {
                        Label("", systemImage: "checkmark.circle")
                    }
                }
                HStack {
                    TextField("Answer 3...", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    Toggle(isOn: $answer3) {
                        Label("", systemImage: "checkmark.circle")
                    }
                }
            }
            Spacer()
            //TODO: Buttons als eigene View auslagern damit überall einheitlich
            // Create Checkpoint
            Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Create")
                    .padding()
                    .frame(width: 130, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .background(Color.init(#colorLiteral(red: 0.3084011078, green: 0.5618229508, blue: 0, alpha: 1)))
                    .cornerRadius(10.0)
            }.padding()
            
        }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CreateCheckpointView_Previews: PreviewProvider {
    static var previews: some View {
        CreateCheckpointView()
    }
}
