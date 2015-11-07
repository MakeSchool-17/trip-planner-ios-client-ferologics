//
//  Constants.swift
//  Tripologics_planner
//
//  Created by mbp_13 on 02/11/15.
//  Copyright © 2015 ferologics. All rights reserved.
//

import Foundation
import CoreData

typealias waipointType = NSSet //Dictionary<String, String>//[(name: String, geopoint: String)]

public let username = Authorization.getUsername()
public let password = Authorization.getPassword()
public let headers = Authorization.jsonifyAuthHeader(Authorization.getAuthHeader(username, password: password))