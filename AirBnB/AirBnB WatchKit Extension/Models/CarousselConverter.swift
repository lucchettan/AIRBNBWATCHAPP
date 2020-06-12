//
//  CarousselConverter.swift
//  AirBnB WatchKit Extension
//
//  Created by Nicolas Lucchetta on 12/12/2019.
//  Copyright © 2019 Nicolas Lucchetta. All rights reserved.
//

import Foundation

import SwiftUI
import CoreLocation

class CarousselConverter {
    func convert(toConvert: [String]) -> [String] {
        print("l'array que je veux modifier est compose de : ")
        print(toConvert)
        var newImageArray : [String] = []
        
        newImageArray.append(toConvert[0])
        
        for x in toConvert {
            newImageArray.append(x)
        }
        
        newImageArray.append(toConvert[(toConvert.count - 1)])
        print("l'array que je veux recuperer est compose de : ")
        print(newImageArray)
        return newImageArray
    }
}
