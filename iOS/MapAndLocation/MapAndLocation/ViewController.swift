//
//  ViewController.swift
//  MapAndLocation
//
//  Created by Angela Delise on 11/3/16.
//  Copyright © 2016 Angela Delise. All rights reserved.
//

import UIKit
//all things location based
//user to points of interest, coordinates on a map but not always
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager? //instance of location manager
    var startLocation: CLLocation? //an object that holds location
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager = CLLocationManager() //assigning value to instance of clmanager
        locationManager?.delegate = self //set the delegate to self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest //set accuracy, k is for key, can change every 100 kilometers
        locationManager?.requestAlwaysAuthorization() //privacy issue
        
       // locationManager?.requestWhenInUseAuthorization() //when leave app a blue bar is on top of the phone, staying location tracking is on
    }
    
    
    //Location Manager Delegate Protocol Methods
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways{
            locationManager?.startUpdatingLocation() //starts 
           // locationManager?.allowsBackgroundLocationUpdates = true //tracking user in the background
            
        }
        else{
            //do something when user doesnt allow location tracking
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //called with location tracker sense change in location
        
        if startLocation == nil {
            //if we dont have a value in start location 
            startLocation = locations.first
        }
        else{
            guard let latest = locations.first // grabs latest location if already have a start location
                else{return} //leave if startlocation = latest
            
            let distanceInMeters = startLocation?.distance(from: latest)
            //get a CL object and record distance
            print("distance in meters:\(distanceInMeters)")
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

