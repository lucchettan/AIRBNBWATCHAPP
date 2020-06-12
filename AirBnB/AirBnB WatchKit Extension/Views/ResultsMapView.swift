//
//  ResultsMapView.swift
//  AirBnB WatchKit Extension
//
//  Created by Nicolas Lucchetta on 11/12/2019.
//  Copyright © 2019 Nicolas Lucchetta. All rights reserved.
//

import SwiftUI
import MapKit

struct ResultsMapView: WKInterfaceObjectRepresentable {
        
    var stays : [Stay]
    func makeWKInterfaceObject(context: WKInterfaceObjectRepresentableContext<ResultsMapView>) -> WKInterfaceMap {
        return WKInterfaceMap()
    }

    func updateWKInterfaceObject(_ map: WKInterfaceMap, context: WKInterfaceObjectRepresentableContext<ResultsMapView>) {
    
        
        let region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 40.843460, longitude: 14.248953),
            span: MKCoordinateSpan(latitudeDelta: 0.03,
            longitudeDelta: 0.03))
        
        map.setRegion(region)
        for stay in stays {
            map.addAnnotation(stay.localisation.coordinate, with: .red)
        }
    }
}
