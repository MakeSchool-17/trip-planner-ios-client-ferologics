//
//  CoreDataClient.swift
//  Tripologics_planner
//
//  Created by mbp_13 on 03/11/15.
//  Copyright © 2015 ferologics. All rights reserved.
//

import Foundation
import CoreData

class CoreDataClient
{
    var managedObjectContext: NSManagedObjectContext
    
    init(managedObjectContext: NSManagedObjectContext)
    {
        self.managedObjectContext = managedObjectContext
    }
}