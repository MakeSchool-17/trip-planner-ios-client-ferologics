//
//  Networking.swift
//  Tripologics_planner
//
//  Created by mbp_13 on 03/11/15.
//  Copyright © 2015 ferologics. All rights reserved.
//

import Foundation
import Gloss
import CoreData

enum DataType: String
{
    case Trip = "/Trip/"
    case User = "/User/"
}

enum RequestType: String
{
    case GET = "GET"
    case POST = "POST"
    case PUSH = "PUSH"
    case DELETE = "DELETE"
}

struct Netwoking
{
    func sendRequest(requestType: RequestType, dataType: DataType, json: AnyObject, onComplete: (NSData throws -> Void))
    {
        let request = try! NSJSONSerialization.dataWithJSONObject(json, options: NSJSONWritingOptions(rawValue: 0))
        let authHeaders = try! NSJSONSerialization.dataWithJSONObject(headers, options: NSJSONWritingOptions(rawValue: 0))
        
        let url = NSURL(string: "localhost\(dataType.rawValue)") // TODO: use real website name not localhost
        
        let requestURL = NSMutableURLRequest(URL: url!)
        requestURL.HTTPMethod = requestType.rawValue
        requestURL.HTTPBody = request
        requestURL.setValue("application/json", forHTTPHeaderField: "content-type")
        
        if (requestType != .POST && dataType != .User) { requestURL.setValue(authHeaders, forKey: "headers") }

        let session = NSURLSession.sharedSession()
        let getData = session.dataTaskWithRequest(requestURL, completionHandler:
        {(data, response, error) -> Void in
            
            do { try onComplete(data!) }
            catch let error as NSError { print(error) }
        })
        
        getData.resume()
    }
}