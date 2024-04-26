//
//  CoreDataManager.swift
//  WaterReminder
//
//  Created by Stacey Smith on 4/24/24.
//

import CoreData

class PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "MyDataModel") // Use the exact name of your data model file
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                // Handle any errors
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }

    func saveContext() {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Handle the error
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

