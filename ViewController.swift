//
//  ViewController.swift
//  AddressFinder
//
//  Created by Dave Johnson on 1/17/18.
//  Copyright © 2018 Paycom. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    var latitude = 21.292185
    var longitutde = -157.667027
    var startLocation: LocationAddress?
    var endLocation: LocationAddress?

    override func viewDidLoad() {
        super.viewDidLoad()
        let location = CLLocation(latitude: latitude, longitude: longitutde)
        
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { [weak self] (placemarks, error) in
            if let error = error {
                print("*** Reverse Geocoding error: \(error.localizedDescription)")
                return
            }
            if let lastPlacemark = placemarks?.last {
                do {
                    self?.startLocation = try LocationAddress(placemark: lastPlacemark)
                    print("\(self!.startLocation!.addressString())")
                } catch {
                    print("Error: \(error), \(error.localizedDescription)")
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}





