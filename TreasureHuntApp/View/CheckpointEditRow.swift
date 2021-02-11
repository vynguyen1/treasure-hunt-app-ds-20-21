//
//  CheckpointRow.swift
//  TreasureHuntApp
//
//  Created by Vy on 29.12.20.
//

import SwiftUI

// TODO: Delete?
struct CheckpointEditRow: View {
    
    // @ObservedObject var treasureHunt: TreasureHunt
    var checkpoint: CheckpointCreateModel
    
    var body: some View {
        HStack {
            Text(checkpoint.name)
            Spacer()
            HStack {
//                Button(action: {print("Edit Checkpoint with id: \(checkpoint.id)")}) {
//                    Image(systemName: "pencil.circle")
//                }
                Button(action: {deleteCheckpoint()},
                       label: {Image(systemName: "trash")})
                .buttonStyle(BorderlessButtonStyle())
            }
        }
    }
    
    func deleteCheckpoint() {
//        let index = findCheckpoint()
//        if index != nil {
//            treasureHunt.checkpoints.remove(at: index!)
//        }
    }
    
//    func findCheckpoint() -> Int? {
//        let index = treasureHunt.checkpoints.firstIndex {$0.id == checkpoint.id}
//        return index
//    }

}
