//
//  Checkpoint+CoreDataProperties.swift
//  TreasureHuntApp
//
//  Created by Vy on 11.02.21.
//
//

import Foundation
import CoreData
import MapKit

extension Checkpoint {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Checkpoint> {
        return NSFetchRequest<Checkpoint>(entityName: "Checkpoint")
    }

    @NSManaged public var checked: Bool
    @NSManaged public var locationLatitude: Double
    @NSManaged public var locationLongitude: Double
    @NSManaged public var hint: String
    @NSManaged public var uuid: UUID
    @NSManaged public var name: String
    @NSManaged public var rank: Int
    @NSManaged public var treasureHunt: TreasureHunt?

}

extension Checkpoint: Identifiable {

}
