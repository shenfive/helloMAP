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
        mymap.isScrollEnabled = true
        mymap.isZoomEnabled = true
        mymap.isRotateEnabled = false
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
    
    @IBAction func longPressAction(_ sender: UILongPressGestureRecognizer) {
        print("long Press!!!")
        let touchPoint = sender.location(in: mymap)
        let location = mymap.convert(touchPoint, toCoordinateFrom: mymap)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "自訂的"
        annotation.subtitle = "詳細資訊"
        self.mymap.addAnnotation(annotation)
    }
    
    
}

