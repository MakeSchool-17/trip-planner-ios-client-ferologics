//
//  CoreDataStack.swift
//  Tripologics_planner
//
//  Created by mbp_13 on 30/10/15.
//  Copyright © 2015 ferologics. All rights reserved.
//

import CoreData

enum CoreDataStackType
{
    case InMemory
    case SQLite
}

class CoreDataStack
{
    private(set) var managedObjectContext: NSManagedObjectContext
    
    private var privateManagedObjectContext: NSManagedObjectContext
    private var storeCoordinator           : NSPersistentStoreCoordinator!
    private var stackType                  : CoreDataStackType
    
    lazy var applicationDocumentsDirectory: NSURL =
    {
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }()
    
    init(_ stackType: CoreDataStackType)
    {
        self.stackType = stackType
        
        let modelURL     = NSBundle.mainBundle().URLForResource("Tripologics_planner", withExtension: "momd")!
        let model        = NSManagedObjectModel(contentsOfURL: modelURL)
        storeCoordinator = NSPersistentStoreCoordinator(managedObjectModel: model!)
        
        managedObjectContext        = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        privateManagedObjectContext = NSManagedObjectContext(concurrencyType: .PrivateQueueConcurrencyType)
        
        managedObjectContext.parentContext = privateManagedObjectContext
        privateManagedObjectContext.persistentStoreCoordinator = storeCoordinator
        
        self.setupPersistentStore()
    }
    
    private func setupPersistentStore()
    {
        do
        {
            switch (stackType)
            {
                case .InMemory:
                    try storeCoordinator.addPersistentStoreWithType(NSInMemoryStoreType, configuration: nil, URL: nil, options: nil)
                case .SQLite:
                    let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("SingleViewCoreData.sqlite")
                    try storeCoordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
            }
        }
            catch
        {
            // Ripport errorz.
            
            var dict = [String: AnyObject]()

            dict[NSLocalizedDescriptionKey]        = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = "There was an error creating or loading the application's saved data."
            dict[NSUnderlyingErrorKey]             = error as NSError
            
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code:  9999, userInfo: dict)
            
            /*
                Replace this with code to handle the error appropriately.
                
                abort() causes the applications to generate a crash log and terminate.
                You should not use this function ina shipping application, although it may be useful during development.
            */
            
            print("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
    }
    
    func save()
    {
        if (!privateManagedObjectContext.hasChanges && !managedObjectContext.hasChanges) { return }
        
        managedObjectContext.performBlockAndWait
        { () -> Void in
            
            do  { try self.managedObjectContext.save() }
            
            catch let error as NSError
                { assertionFailure("Error saving context: \(error), \(error.userInfo)") }
            catch
                { assertionFailure("Undefined error") }
            
            self.privateManagedObjectContext.performBlock(
            { () -> Void in
                
                do  { try self.privateManagedObjectContext.save() }
                
                catch let error as NSError
                    { assertionFailure("Error saving context: \(error), \(error.userInfo)") }
                catch
                    { assertionFailure("Undefined error") }
            })
        }
    }
}