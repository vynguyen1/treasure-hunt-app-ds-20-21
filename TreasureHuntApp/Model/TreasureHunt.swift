//
//  TreasureHunt.swift
//  TreasureHuntApp
//
//  Created by Vy on 27.12.20.
//

import Foundation
import MapKit

class TreasureHunt: Identifiable, ObservableObject {
    
    let uuid = UUID()
    @Published var name: String
    @Published var description: String
    @Published var checkpoints: [Checkpoint]
    @Published var finished: Bool
    @Published var inProgress: Bool

    init(name: String, description: String, checkpoints: [Checkpoint], finished: Bool = false, inProgress: Bool = false) {
        self.name = name
        self.description = description
        self.checkpoints = checkpoints
        self.finished = finished
        self.inProgress = inProgress
    }
}
