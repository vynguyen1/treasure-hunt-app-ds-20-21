//
//  CheckpointRow.swift
//  TreasureHuntApp
//
//  Created by Vy on 29.12.20.
//

import SwiftUI

struct CheckpointEditRow: View {
    
    @ObservedObject var treasureHunt: TreasureHunt
    var checkpoint: Checkpoint
    
    var body: some View {
        HStack {
            Text(checkpoint.name)
            Spacer()
            HStack {
//                Button(action: {print("Edit Checkpoint with id: \(checkpoint.id)")}) {
//                    Image(systemName: "pencil.circle")
//                }
                Button(action: {
                    print("Delete Checkpoint with id: \(checkpoint.id)")
                    deleteCheckpoint()
                }) {
                    Image(systemName: "trash")
                }.buttonStyle(BorderlessButtonStyle())
            }
        }
    }
    
    func deleteCheckpoint() {
        let index = findCheckpoint()
        if index != nil {
            treasureHunt.checkpoints.remove(at: index!)
        }
    }
    
    func findCheckpoint() -> Int? {
        let index = treasureHunt.checkpoints.firstIndex {$0.id == checkpoint.id}
        return index
    }

}
