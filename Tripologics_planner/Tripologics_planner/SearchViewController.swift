//
//  SearchViewController.swift
//  Tripologics_planner
//
//  Created by mbp_13 on 30/10/15.
//  Copyright © 2015 ferologics. All rights reserved.
//

import Foundation
import UIKit

/*

Integrate google p;aces api, probably in a helper class or whatnot

handle the states of the searchbar

implement required methods

*/

class SearchViewController: UIViewController
{
 
    override func viewDidLoad()
    {
        
    }
    
    override func viewWillAppear(animated: Bool)
    {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) //
    {
        // tell the collection view to update the view with new info
        if let _ = segue.destinationViewController as? TripsViewController
        {
            
        }
    }
}