//
//  DetailedHuntView.swift
//  TreasureHuntApp
//
//  Created by Vy on 28.12.20.
//

import SwiftUI

struct DetailedHuntView: View {
    
    @State private var treasureHunt = TreasureHunt.getTreasureHunts().first!
    
    var body: some View {
        VStack {
            HStack {
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                Image(systemName: "arrow.backward")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .frame(width: 40, height: 30, alignment: .topLeading)
                }.padding(EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 0))
                Spacer()
            }
            Image("andrew-neel-unsplash").resizable()
                .frame(height: 200.0, alignment: .leading)
            Text(treasureHunt.name)
                .padding()
                .font(.system(size: 28, weight: .light))
            
            Text(treasureHunt.description)
                .padding()
            Text("Checkpoints:")
                .font(.system(size: 18, weight: .light))
            List(treasureHunt.checkpoints) {
                checkpoint in CheckpointRow(checkpoint: checkpoint)
            }
            // Start/Continue Hunt
            Text("Start")
                .padding()
                .frame(width: 130, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .background(Color.init(#colorLiteral(red: 0.3084011078, green: 0.5618229508, blue: 0, alpha: 1)))
                .cornerRadius(10.0)
            Divider()
        }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct DetailedHuntView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedHuntView()
    }
}
