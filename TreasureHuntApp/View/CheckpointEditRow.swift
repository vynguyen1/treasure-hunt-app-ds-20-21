//
//  CheckpointRow.swift
//  TreasureHuntApp
//
//  Created by Vy on 29.12.20.
//

import SwiftUI

struct CheckpointEditRow: View {
    
    var checkpoint: Checkpoint
    
    var body: some View {
        HStack() {
            Text(checkpoint.name)
            Spacer()
            Group {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "pencil.circle")
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "trash")
                }
            }
        }
    }
}
