//
//  CurrentPositionVC.swift
//  GoogleMap
//
//  Created by Nguyễn Văn Tú on 11/23/19.
//  Copyright © 2019 Nguyễn Văn Tú. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
class CurrentPositionVC: UIViewController {
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var mapView: GMSMapView!
    var placesClient: GMSPlacesClient!
    var zoomLevel: Float = 15.0
    
    // An array to hold the list of likely places.
    var likelyPlaces: [GMSPlace] = []
    
    // The currently selected place.
    var selectedPlace: GMSPlace?
    override func viewDidLoad() {
        super.viewDidLoad()
        addMapView()
        requestCurrentPosition()
        // Do any additional setup after loading the view.
    }
    
    func requestCurrentPosition() {
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
        placesClient = GMSPlacesClient.shared()
    }
    
    func addMapView() {
        let camera = GMSCameraPosition.camera(withLatitude: defaultLocation.latitude,
                                              longitude: defaultLocation.longitude,
                                              zoom: zoomLevel)
        mapView = GMSMapView.map(withFrame: view.bounds, camera: camera)
        mapView.settings.myLocationButton = true
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //mapView.isMyLocationEnabled = true

        // Add the map to the view, hide it until we've got a location update.
        view.addSubview(mapView)
        mapView.isHidden = true
    }
    
    
    // Populate the array with the list of likely places.
    func listLikelyPlaces() {
      // Clean up from previous sessions.
      likelyPlaces.removeAll()

      placesClient.currentPlace(callback: { (placeLikelihoods, error) -> Void in
        if let error = error {
          // TODO: Handle the error.
          print("Current Place error: \(error.localizedDescription)")
          return
        }

        // Get likely places and add to the list.
        if let likelihoodList = placeLikelihoods {
          for likelihood in likelihoodList.likelihoods {
            let place = likelihood.place
            self.likelyPlaces.append(place)
          }
        }
      })
    }
}
extension CurrentPositionVC: CLLocationManagerDelegate {
    
    // Handle incoming location events.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!
        print("Location: \(location)")
        
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                              longitude: location.coordinate.longitude,
                                              zoom: zoomLevel)
        
        if mapView.isHidden {
            mapView.isHidden = false
            mapView.camera = camera
        } else {
            mapView.animate(to: camera)
        }
        
        listLikelyPlaces()
    }
    
    // Handle authorization for the location manager.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted:
            print("Location access was restricted.")
        case .denied:
            print("User denied access to location.")
            // Display the map using the default location.
            mapView.isHidden = false
        case .notDetermined:
            print("Location status not determined.")
        case .authorizedAlways: fallthrough
        case .authorizedWhenInUse:
            print("Location status is OK.")
        default:
            break
        }
    }
    
    // Handle location manager errors.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        print("Error: \(error)")
    }
}
