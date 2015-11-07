//
//  Authorization.swift
//  Tripologics_planner
//
//  Created by mbp_13 on 03/11/15.
//  Copyright © 2015 ferologics. All rights reserved.
//

import Foundation
import Gloss

struct Authorization
{
    static func getAuthHeader(username: String, password: String) -> String
    {
        let loginString = NSString(format: "%@:%@", username, password)
        let loginData: NSData = loginString.dataUsingEncoding(NSUTF8StringEncoding)!
        let base64LoginString = loginData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
        let authHeaderString = "Base \(base64LoginString)"
        
        return authHeaderString
    }
    
    static func jsonifyAuthHeader(headers: String) -> JSON
    {
        return jsonify( [ "headers" ~~> headers ] )!
    }
    
    static func getUsername() -> String
    {
        return "benji-san" // TODO: return stored username from NSUserdefaults
    }
    
    static func getPassword() -> String
    {
        return "IBetThatYouAren'tReadingThis" // TODO: return stored pwd from NSUserdefaults
    }
}