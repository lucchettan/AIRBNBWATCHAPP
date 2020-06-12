//
//  Stay.swift
//  AirBnB WatchKit Extension
//
//  Created by Nicolas Lucchetta on 09/12/2019.
//  Copyright © 2019 Nicolas Lucchetta. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

struct Stay: Identifiable {
    var id = UUID()
    var name : String
    var localisation: CLLocation
    var capacity : Int
    var bed : Int
    var checkin : String
    var checkout : String
    var type : String
    var price : Int
    var pictures : [String]
}
