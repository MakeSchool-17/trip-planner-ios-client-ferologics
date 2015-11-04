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

protocol TripModel
{
//    var name: String { get }
//    var waipoints: waipointType { get }
//    var startDate: NSDate { get }
//    var duration:  NSNumber { get }
    
    func removeTrip()
    func addTrip()
}

class Trip: NSManagedObject
{
    
    
    
    func removeTrip()
    {
        
    }
    
    func addTrip()
    {
        
    }
}

extension Trip
{
    @NSManaged var name: String?
    @NSManaged var waitpoints: [waipointType]?
    @NSManaged var startDate: NSDate?
    @NSManaged var duration: NSNumber?
}