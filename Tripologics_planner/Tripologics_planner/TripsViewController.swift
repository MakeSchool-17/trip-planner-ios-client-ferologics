//
//  ViewController.swift
//  Tripologics_planner
//
//  Created by mbp_13 on 22/10/15.
//  Copyright © 2015 ferologics. All rights reserved.
//

import UIKit

class TripsViewController: UIViewController
{

/*

create a collection of trips - helper
    
manage states of the cells and delegate
    
*/
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool)
    {
        
    }
}

extension TripsViewController: UICollectionViewDataSource
{
    
}

extension TripsViewController: UICollectionViewDelegateFlowLayout
{
    
}
