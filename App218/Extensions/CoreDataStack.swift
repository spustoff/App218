//
//  CoreDataStack.swift
//  App218
//
//  Created by IGOR on 12/10/2023.
//

import SwiftUI
import CoreData

class CoreDataStack {
    
    static let shared = CoreDataStack()

    private init() {}

    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "CardModel")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        return container
    }()
    
    func saveContext() {
        
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            
            do {
                
                try context.save()
                
            } catch {
                
                let nserror = error as NSError
                
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
