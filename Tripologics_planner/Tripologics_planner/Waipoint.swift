//
//  Trip.swift
//  Tripologics_planner
//
//  Created by mbp_13 on 30/10/15.
//  Copyright © 2015 ferologics. All rights reserved.
//

import Foundation
import CoreData
import Gloss

typealias waipointType = NSSet //Dictionary<String, String>//[(name: String, geopoint: String)]

class Waipoint: NSManagedObject
{
    convenience init(context: NSManagedObjectContext)
    {
        let entityDescription = NSEntityDescription.entityForName("Waipoint", inManagedObjectContext: context)!
        self.init(entity: entityDescription, insertIntoManagedObjectContext: context)
    }
    
    convenience init(context: NSManagedObjectContext, jsonWaipoint: JSONWaipoint)
    {
        let entityDescription = NSEntityDescription.entityForName("Waipoint", inManagedObjectContext: context)!
        self.init(entity: entityDescription, insertIntoManagedObjectContext: context)
        
        name      = jsonWaipoint.name
        longitude = jsonWaipoint.longitude
        latitude  = jsonWaipoint.latitude
        trip      = jsonWaipoint.trip
    }
}

extension Waipoint
{
    @NSManaged var name:      String?
    @NSManaged var longitude: NSNumber?
    @NSManaged var latitude:  NSNumber?
    @NSManaged var trip:      Trip?
}