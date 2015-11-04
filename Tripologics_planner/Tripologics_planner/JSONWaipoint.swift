//
//  JSONWaipoint.swift
//  Tripologics_planner
//
//  Created by mbp_13 on 03/11/15.
//  Copyright © 2015 ferologics. All rights reserved.
//

import Foundation
import Gloss

struct JSONWaipoint: Decodable
{
    let latitude:  Double?
    let longitude: Double?
    let name:      String?
    let trip:      Trip?
    
    init?(json: JSON)
    {
        self.name      = "name" <~~ json
        self.latitude  = "latitude" <~~ json
        self.longitude = "longitude"  <~~ json
        self.trip      = "trip" <~~ json
    }
}