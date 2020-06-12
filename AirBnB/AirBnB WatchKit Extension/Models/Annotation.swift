//
//  Annotation.swift
//  AirBnB WatchKit Extension
//
//  Created by Nicolas Lucchetta on 11/12/2019.
//  Copyright © 2019 Nicolas Lucchetta. All rights reserved.
//

import UIKit
import MapKit
import CloudKit
import CoreLocation

class Annotation: NSObject, MKAnnotation {

  let locationName: String
  let coordinate: CLLocationCoordinate2D
  
  init(locationName: String, coordinate: CLLocationCoordinate2D) {
    self.locationName = locationName
    self.coordinate = coordinate
    
    super.init()
  }
  
  var subtitle: String? {
    return locationName
  }
}
