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
        mymap.isScrollEnabled = false
        mymap.isZoomEnabled = false
        mymap.isRotateEnabled = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let latitude:CLLocationDegrees = 25.0444032
            let longitude:CLLocationDegrees = 121.5141468
            let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
            let xScale:CLLocationDegrees = 0.01
            let yScale:CLLocationDegrees = 0.01
            let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: yScale, longitudeDelta: xScale)
            let region:MKCoordinateRegion = MKCoordinateRegion.init(center: location, span: span)
            self.mymap.setRegion(region, animated: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                let annotation = MKPointAnnotation()
                annotation.coordinate = location
                annotation.title = "譯智"
                annotation.subtitle = "教育訓練中心"
                self.mymap.addAnnotation(annotation)
            }
            
            
        }
        
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
    
    @IBAction func longPressAtion(_ sender: UILongPressGestureRecognizer) {
        print("Pressed!")
        let point = sender.location(in: mymap)
        let location = mymap.convert(point, toCoordinateFrom: mymap)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "自訂位置"
        print(location)
        self.mymap.addAnnotation(annotation)
    }
}

