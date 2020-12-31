//
//  CheckpointRow.swift
//  TreasureHuntApp
//
//  Created by Vy on 29.12.20.
//

import SwiftUI

struct CheckpointRow: View {
    
    var checkpoint: Checkpoint
    
    var body: some View {
        HStack {
            if checkpoint.checked {
                Text(checkpoint.name)
                Spacer()
                Image(systemName: "checkmark.circle")
            } else {
                Text("???")
                Spacer()
                Image(systemName: "xmark")
            }
        }
    }
}
