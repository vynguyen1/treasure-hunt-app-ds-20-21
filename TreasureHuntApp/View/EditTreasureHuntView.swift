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
                Text("Add Checkpoint").modifyAdd()
            }
            List(treasureHunt.checkpoints) { checkpoint in
                CheckpointEditRow(treasureHunt: treasureHunt, checkpoint: checkpoint)
            }
        }
    }
}

struct EditTreasureHuntView_Previews: PreviewProvider {
    static var previews: some View {
        let treasureHunt = TreasureHunts().treasureHunts.first!
        EditTreasureHuntView(treasureHunt: treasureHunt)
    }
}
