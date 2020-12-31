//
//  CreateTreasureHuntView.swift
//  TreasureHuntApp
//
//  Created by Vy on 29.12.20.
//

import SwiftUI

struct CreateTreasureHuntView: View {
    
    // For testing
    @State private var checkpoints = TreasureHunt.getTreasureHunts().first!.checkpoints
    
    var body: some View {
        VStack {
            HStack {
                // Go back
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "arrow.backward")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }.padding()
                Spacer()
                // Create Hunt
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Create")
                        .padding()
                        .frame(width: 130, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .background(Color.init(#colorLiteral(red: 0.3084011078, green: 0.5618229508, blue: 0, alpha: 1)))
                        .cornerRadius(10.0)
                }.padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 10))
                
            }

            Image("treasure-hunt-test-image")
                .resizable()
                .frame(height: 200.0)
            
            Text("Create a new treasure hunt")
                .padding()
                .font(.system(size: 24, weight: .light))
            TextField("Name...", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .padding()
                .frame(height: 10, alignment: .leading)
            TextField("Description...", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .padding()
                .frame(height: 100, alignment: .topLeading)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Add Checkpoint")
                    .padding()
                    .frame(width: 170, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .background(Color.init(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
                    .cornerRadius(10.0)
            }
            // Testing
            List(checkpoints) {
                checkpoint in CheckpointEditRow(checkpoint: checkpoint)
            }
        }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CreateTreasureHuntView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTreasureHuntView()
    }
}
