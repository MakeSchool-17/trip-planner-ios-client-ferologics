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
    
    private let reuseIdentifier = "TripCell"
    private let sectionInsets = UIEdgeInsets(top: 50, left: 20, bottom: 50, right: 20)
    
    let dummyText = "ifz's a zuuu"
    
    var trips: [Trip] = []
    
    @IBOutlet weak var tripCollectionView: TripCollectionView!
/*

create a collection of trips - helper
    
manage states of the cells and delegate
    
*/
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.tripCollectionView?.delegate = self
        self.tripCollectionView?.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool)
    {
        
    }
}

extension TripsViewController: UICollectionViewDataSource
{
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int { return 20 }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return 5 }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! TripCell
        cell.backgroundColor = UIColor.whiteColor()
        cell.tripNameLabel.text = dummyText
        return cell
    }
}

extension TripsViewController: UICollectionViewDelegateFlowLayout
{
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        return CGSize(width: 30, height: 30)
//    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
}
