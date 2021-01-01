//
//  DetailedHuntView.swift
//  TreasureHuntApp
//
//  Created by Vy on 28.12.20.
//

import SwiftUI

struct DetailedHuntView: View {
    
    @ObservedObject var treasureHunt: TreasureHunt
    
    var body: some View {
        VStack {
            Image("andrew-neel-unsplash").resizable()
                //.scaledToFit()
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
            HStack {
                NavigationLink(destination: MapView(locations:treasureHunt.checkpoints.filter {$0.checked})) {
                    Text(!treasureHunt.inProgress ? "Start" : "Continue")
                        .padding()
                        .frame(width: 130, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .background(Color.init(#colorLiteral(red: 0.3084011078, green: 0.5618229508, blue: 0, alpha: 1)))
                        .cornerRadius(10.0)
                }

                NavigationLink(destination: EditTreasureHuntView(treasureHunt: treasureHunt)) {
                    Text("Edit")
                        .padding()
                        .frame(width: 130, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .background(Color.init(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
                        .cornerRadius(10.0)
                }
            }
            Divider()
        }
    }
}

struct DetailedHuntView_Previews: PreviewProvider {
    static var previews: some View {
        let treasureHunt = TreasureHunt.getTreasureHunts().first!
        DetailedHuntView(treasureHunt: treasureHunt)
    }
}
