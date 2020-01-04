//
//  ViewController.swift
//  helloMAP
//
//  Created by 申潤五 on 2019/12/28.
//  Copyright © 2019 申潤五. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var mymap: MKMapView!
    var locationMgr:CLLocationManager? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationMgr = CLLocationManager()
        locationMgr?.requestWhenInUseAuthorization()
        locationMgr?.delegate = self
        locationMgr?.desiredAccuracy = kCLLocationAccuracyBest
        locationMgr?.activityType = .automotiveNavigation
        locationMgr?.startUpdatingLocation()
        mymap.userTrackingMode = .followWithHeading
        
    }
    
    //MARK: Location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let coordinate = locations[0].coordinate
        print(coordinate)
        let xScale:CLLocationDegrees = 0.01
        let yScale:CLLocationDegrees = 0.01
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: yScale, longitudeDelta: xScale)
        let region:MKCoordinateRegion = MKCoordinateRegion.init(center: coordinate, span: span)
        self.mymap.setRegion(region, animated: true)
    }
    

    @IBAction func typeChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            mymap.mapType = .standard
        case 1:
            mymap.mapType = .satellite
        case 2:
            mymap.mapType = .hybrid
        default:
            break
        }
    }
}

