//
//  CreateTreasureHuntView.swift
//  TreasureHuntApp
//
//  Created by Vy on 01.01.21.
//

import SwiftUI

struct CreateTreasureHuntView: View {
    
    @ObservedObject var treasureHunt: TreasureHunt
    @ObservedObject var treasureHunts: TreasureHunts
    
    var body: some View {
        VStack {
            Image("treasure-hunt-test-image")
                .resizable()
                .frame(height: 200.0)
            
            Text("Create a treasure hunt")
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
            Button(action: addTreasureHunt) {
                Image(systemName: "checkmark").modifyButton(backgroundColor: Color.init(#colorLiteral(red: 0.3084011078, green: 0.5618229508, blue: 0, alpha: 1)))
            }.padding()
        }
    }
    
    func addTreasureHunt() {
        treasureHunts.treasureHunts.append(treasureHunt)
    }
}

struct CreateTreasureHuntView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTreasureHuntView(treasureHunt: TreasureHunt(name: "", description: "", checkpoints: [Checkpoint]()), treasureHunts: TreasureHunts())
    }
}
