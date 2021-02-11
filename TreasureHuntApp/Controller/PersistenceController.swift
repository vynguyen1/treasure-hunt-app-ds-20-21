//
//  PersistenceController.swift
//  TreasureHuntApp
//
//  Created by Vy on 06.02.21.
//

import CoreData
import MapKit

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let treasureHunt = createTreasureHuntForPreview(viewContext: viewContext)
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
    
    static func createTreasureHuntForPreview(viewContext: NSManagedObjectContext) -> TreasureHunt {
        let treasureHuntDescription = NSEntityDescription.entity(forEntityName: "TreasureHunt", in: viewContext)
        let treasureHunt = TreasureHunt(entity: treasureHuntDescription!, insertInto: viewContext)
        treasureHunt.name = "Treasure Hunt"
        treasureHunt.uuid = UUID()
        treasureHunt.inProgress = false
        treasureHunt.finished = false
        treasureHunt.huntDescription = "Description of the Treasure Hunt"
        
        let checkpointDescription = NSEntityDescription.entity(forEntityName: "Checkpoint", in: viewContext)
        let checkpoint = Checkpoint(entity: checkpointDescription!, insertInto: viewContext)
        checkpoint.uuid = UUID()
        checkpoint.name = "Checkpoint"
        checkpoint.checked = false
        checkpoint.hint = "This is a hint."
        checkpoint.locationLatitude = 52.545175
        checkpoint.locationLongitude = 13.3494393
        checkpoint.treasureHunt = treasureHunt
        
        return treasureHunt
    }

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "TreasureHuntApp")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                Typical reasons for an error here include:
                * The parent directory does not exist, cannot be created, or disallows writing.
                * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                * The device is out of space.
                * The store could not be migrated to the current model version.
                Check the error message to determine what the actual problem was.
                */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
