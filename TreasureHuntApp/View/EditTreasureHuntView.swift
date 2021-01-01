//
//  CreateTreasureHuntView.swift
//  TreasureHuntApp
//
//  Created by Vy on 29.12.20.
//

import SwiftUI

struct EditTreasureHuntView: View {
    
    @ObservedObject var treasureHunt: TreasureHunt
    
    var body: some View {
        VStack {
            Image("treasure-hunt-test-image")
                .resizable()
                .frame(height: 200.0)
            
            Text("Edit treasure hunt")
                .padding()
                .font(.system(size: 24, weight: .light))
            TextField("Name...", text: $treasureHunt.name)
                .padding()
                .frame(height: 10, alignment: .center)
            TextEditor(text: $treasureHunt.description)
                .padding()
                .frame(width: UIScreen.main.bounds.width, height: 80, alignment: .topLeading)
            
            NavigationLink(
                destination: CreateCheckpointView(treasureHunt: treasureHunt)) {
                Text("Add Checkpoint")
                    .padding()
                    .frame(width: 170, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .background(Color.init(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
                    .cornerRadius(10.0)
            }
            List(treasureHunt.checkpoints) {
                checkpoint in CheckpointEditRow(treasureHunt: treasureHunt, checkpoint: checkpoint)
            }
//            NavigationLink(
//                destination: DetailedHuntView(treasureHunt: treasureHunt)) {
//                Image(systemName: "checkmark")
//                .padding()
//                .frame(width: 130, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                .foregroundColor(.white)
//                .background(Color.init(#colorLiteral(red: 0.3084011078, green: 0.5618229508, blue: 0, alpha: 1)))
//                .cornerRadius(10.0)
//            }.padding()
        }//.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct EditTreasureHuntView_Previews: PreviewProvider {
    static var previews: some View {
        let treasureHunt = TreasureHunt.getTreasureHunts().first!
        EditTreasureHuntView(treasureHunt: treasureHunt)
    }
}