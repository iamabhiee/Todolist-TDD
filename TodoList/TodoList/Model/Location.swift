//
//  Location.swift
//  TodoList
//
//  Created by Abhishek Sheth on 13/08/16.
//  Copyright © 2016 Abhishek. All rights reserved.
//

import Foundation
import CoreLocation

struct Location {
    let name : String
    let coordinate : CLLocationCoordinate2D?
    
    init(name : String, coordinate : CLLocationCoordinate2D? = nil) {
        self.name = name
        self.coordinate = coordinate
    }
}