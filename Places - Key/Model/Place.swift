//
//  Place.swift
//  Places - Key
//
//  Created by Johnny Hicks on 4/23/19.
//  Copyright © 2019 Johnny Hicks. All rights reserved.
//

import Foundation

class Place {
    let name: String
    // You can think of a tuple as a many struct that has 0 or more types
    let location: (latitude: Double, longitude: Double)
    
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.location = (latitude: latitude, longitude: longitude)
    }
}
