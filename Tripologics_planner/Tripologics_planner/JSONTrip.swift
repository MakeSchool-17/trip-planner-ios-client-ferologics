//
//  JSONTrip.swift
//  Tripologics_planner
//
//  Created by mbp_13 on 03/11/15.
//  Copyright © 2015 ferologics. All rights reserved.
//

import Foundation
import Gloss

struct JSONTrip: Decodable
{
    let name:      String?
    let waipoints: [JSONWaipoint]?
    let serverID:  String?
    
    init?(json: JSON)
    {
        self.name      = "name" <~~ json
        self.waipoints = "waipoints" <~~ json
        self.serverID  = "serverID" <~~ json
    }
}