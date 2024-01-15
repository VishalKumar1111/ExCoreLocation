//
//  ViewController.swift
//  ExCoreLocation
//
//  Created by RLogixxTraining on 06/10/23.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager: CLLocationManager?
    let geocoder = CLGeocoder()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager = CLLocationManager()
           locationManager?.delegate = self
           locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            let myCoord = locations[locations.count - 1]
            // get lat and long
            let myLat = myCoord.coordinate.latitude
            let myLong = myCoord.coordinate.longitude
            let myCoord2D = CLLocationCoordinate2D(latitude: myLat, longitude: myLong)

        print("\(myLat)")
        print("\(myLong)")
        let location = locations[0]
        
        let myAnnotation: MKPointAnnotation = MKPointAnnotation()
               myAnnotation.coordinate = CLLocationCoordinate2DMake(myCoord.coordinate.latitude, myCoord.coordinate.longitude)
               myAnnotation.title = "Dhruv Tara"
               mapView.addAnnotation(myAnnotation)
        
        
        
        geocoder.reverseGeocodeLocation(location, completionHandler: {(placemarks, error) in
               if (error != nil) {
                   print("Error in reverseGeocode")
                   }

               let placemark = placemarks! as [CLPlacemark]
               if placemark.count > 0 {
                   let placemark = placemarks![0]
                   print(placemark.administrativeArea)
                   print(placemark.country)
                   print(placemark.postalCode)
                   print(placemark.name)
                   print(placemark.region)
               }
           })
           
        }
              
              }
    



