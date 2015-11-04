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

class Trip: NSManagedObject
{
    convenience init(context: NSManagedObjectContext)
    {
        let entityDescription = NSEntityDescription.entityForName("Trip", inManagedObjectContext: context)!
        self.init(entity: entityDescription, insertIntoManagedObjectContext: context)
    }
    
    convenience init(context: NSManagedObjectContext, jsonTrip: JSONTrip)
    {
        let entityDescription = NSEntityDescription.entityForName("Trip", inManagedObjectContext: context)!
        self.init(entity: entityDescription, insertIntoManagedObjectContext: context)
        
        name     = jsonTrip.name
        serverID = jsonTrip.serverID
    }
}

extension Trip
{
    @NSManaged var name:       String?
    @NSManaged var waitpoints: [waipointType]?
    @NSManaged var serverID:   String?
    @NSManaged var startDate:  NSDate?
    @NSManaged var duration:   NSNumber?
}