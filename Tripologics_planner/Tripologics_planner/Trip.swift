//
//  Trip.swift
//  Tripologics_planner
//
//  Created by mbp_13 on 30/10/15.
//  Copyright © 2015 ferologics. All rights reserved.
//

import Foundation
import CoreLocation

protocol Trip
{
    var name: String { get }
    var waipoints: [(name: String, geopoint: CLLocation)] { get }
    
    func removeTrip()
    func addTrip()
}
                                                                                                            