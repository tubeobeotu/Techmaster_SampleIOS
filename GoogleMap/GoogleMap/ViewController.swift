//
//  ViewController.swift
//  GoogleMap
//
//  Created by Nguyễn Văn Tú on 11/23/19.
//  Copyright © 2019 Nguyễn Văn Tú. All rights reserved.
//

import UIKit
import GoogleMaps
let defaultLocation = CLLocationCoordinate2D.init(latitude: 21.027763, longitude: 105.834160)
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addMapWithMarker()
    }
    
    func addStreetView() {
        let panoView = GMSPanoramaView(frame: .zero)
        self.view = panoView

        panoView.moveNearCoordinate(CLLocationCoordinate2D(latitude: -33.732, longitude: 150.312))
    }
    
    func addMapWithMarker() {
        // GMSCameraPosition
        let camera = GMSCameraPosition.camera(withLatitude: 37.36, longitude: -122.0, zoom: 6)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.mapType = .hybrid
            
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 37.36, longitude: -122.0)
        marker.title = "Techmaster"
        marker.snippet = "CS2"
        marker.map = mapView
        
        drawPolyline(mapView: mapView)
    }
    
    func drawPolyline(mapView: GMSMapView) {
        let path = GMSMutablePath()
        path.add(CLLocationCoordinate2D(latitude: 37.36, longitude: -122.0))
        path.add(CLLocationCoordinate2D(latitude: 37.45, longitude: -122.0))
        path.add(CLLocationCoordinate2D(latitude: 37.45, longitude: -122.2))
        path.add(CLLocationCoordinate2D(latitude: 37.36, longitude: -122.2))
        path.add(CLLocationCoordinate2D(latitude: 37.36, longitude: -122.0))
        let polyline = GMSPolyline(path: path)
        polyline.strokeWidth = 10.0
        polyline.strokeColor = UIColor.red
        polyline.geodesic = true
        let rectangle = GMSPolyline(path: path)
        rectangle.map = mapView
        
        //path = nil / mapView.clear()
    }


}

