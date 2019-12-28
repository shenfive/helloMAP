//
//  ViewController.swift
//  helloMAP
//
//  Created by 申潤五 on 2019/12/28.
//  Copyright © 2019 申潤五. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mymap: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let latitude:CLLocationDegrees = 25.0444032
            let longitude:CLLocationDegrees = 121.5141468
            let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
            let xScale:CLLocationDegrees = 0.01
            let yScale:CLLocationDegrees = 0.01
            let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: yScale, longitudeDelta: xScale)
            let region:MKCoordinateRegion = MKCoordinateRegion.init(center: location, span: span)
            self.mymap.setRegion(region, animated: true)

        }
        
    }


}

