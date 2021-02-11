//
//  TreasureHunt+CoreDataProperties.swift
//  TreasureHuntApp
//
//  Created by Vy on 11.02.21.
//
//

import Foundation
import CoreData

extension TreasureHunt {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TreasureHunt> {
        return NSFetchRequest<TreasureHunt>(entityName: "TreasureHunt")
    }

    @NSManaged public var finished: Bool
    @NSManaged public var huntDescription: String
    @NSManaged public var uuid: UUID
    @NSManaged public var inProgress: Bool
    @NSManaged public var name: String
    @NSManaged public var checkpoints: Set<Checkpoint>?

}

// MARK: Generated accessors for checkpoints
extension TreasureHunt {

    @objc(addCheckpointsObject:)
    @NSManaged public func addToCheckpoints(_ value: Checkpoint)

    @objc(removeCheckpointsObject:)
    @NSManaged public func removeFromCheckpoints(_ value: Checkpoint)

    @objc(addCheckpoints:)
    @NSManaged public func addToCheckpoints(_ values: Set<Checkpoint>)

    @objc(removeCheckpoints:)
    @NSManaged public func removeFromCheckpoints(_ values: Set<Checkpoint>)

}

extension TreasureHunt: Identifiable {

}
