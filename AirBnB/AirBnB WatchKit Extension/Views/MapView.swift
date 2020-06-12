//
//  MapView.swift
//  AirBnB WatchKit Extension
//
//  Created by Nicolas Lucchetta on 11/12/2019.
//  Copyright © 2019 Nicolas Lucchetta. All rights reserved.
//

import SwiftUI
import MapKit
//---> WKInterfaceObjectRepresentable = UIViewControllerRepresentable on WatchKit---------------------------------------------------
struct MapView: WKInterfaceObjectRepresentable {
    
//------> we take a stay in consideration to set the map on the right place
//------> we could have mark the map with multiple landmark
    
    var stay : Stay
//------> This will create our map element
    func makeWKInterfaceObject(context: WKInterfaceObjectRepresentableContext<MapView>) -> WKInterfaceMap {
        return WKInterfaceMap()
    }

    func updateWKInterfaceObject(_ map: WKInterfaceMap, context: WKInterfaceObjectRepresentableContext<MapView>) {
        
//------> we define the range of the map
        let span = MKCoordinateSpan(latitudeDelta: 0.015,
            longitudeDelta: 0.015)
//------> the center of the map
        let region = MKCoordinateRegion(
            center: stay.localisation.coordinate,
            span: span)
//------> we assign everything we declared to the map that we have created
        map.setRegion(region)
//------> we add the landmark on spot that we want
        map.addAnnotation(stay.localisation.coordinate, with: .red)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(stay: StayGetter().getStays()[0])
    }
}

