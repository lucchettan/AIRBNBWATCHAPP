//
//  StayGetter.swift
//  AirBnB WatchKit Extension
//
//  Created by Nicolas Lucchetta on 10/12/2019.
//  Copyright © 2019 Nicolas Lucchetta. All rights reserved.
//

import Foundation
import CoreLocation

class StayGetter {
    func getStays() -> [Stay] {
        let stays: [Stay] = [
            Stay(name: "Beautifull Appt in Montesanto", localisation: CLLocation(latitude: 40.836594, longitude: 14.238940), capacity: 3, bed: 1, checkin: "16:00", checkout: "12:00", type: "Appartement", price: 62, pictures: ["3ppl-1", "3ppl-2", "3ppl-3"]),
            Stay(name: "Loft in Plebiscito", localisation: CLLocation(latitude: 40.835742, longitude: 14.249465), capacity: 4, bed: 2, checkin: "15:00", checkout: "13:00", type: "Appartement", price: 82, pictures: ["Dalila1", "Dalila2", "Dalila3"]),
            Stay(name: "Cozy apartment in the city Center", localisation: CLLocation(latitude: 40.843594, longitude: 14.248976), capacity: 4, bed: 3, checkin: "15:00", checkout: "12:00", type: "Appartement", price: 73, pictures: ["terasse-0", "terasse-1", "terasse-2", "terasse-3"]),
            Stay(name: "B&B NONNO CICCIO", localisation: CLLocation(latitude: 40.840483, longitude: 14.246822), capacity: 3, bed: 2, checkin: "14:00", checkout: "14:00", type: "Room", price: 63, pictures: ["seaview-0", "seaview-1", "seaview-2"]),
            Stay(name: "Casa nel bosco", localisation: CLLocation(latitude: 40.834297, longitude: 14.240506), capacity: 5, bed: 3, checkin: "14:00", checkout: "12:00", type: "House", price: 93, pictures: ["casa-0" ,"casa-1", "casa-2", "casa-3"]),
            Stay(name: "Dalila's apartments 4", localisation: CLLocation(latitude: 40.838446, longitude: 14.247409), capacity: 2, bed: 1, checkin: "15:00", checkout: "13:00", type: "Room", price: 58, pictures: ["2ppl-0", "2ppl-1", "2ppl-2"]),
        ]
        return stays
    }
    
    
    func filterStays(filter: Int) -> [Stay] {
        
        let staysToFilter = getStays()
        
        var filteredStays: [Stay] = []
        
        for stay in staysToFilter {
            if stay.capacity >= filter {
                filteredStays.append(stay)
            }
        }
        return filteredStays
    }
}

