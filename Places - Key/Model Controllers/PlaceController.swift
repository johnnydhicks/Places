//
//  PlaceController.swift
//  Places - Key
//
//  Created by Johnny Hicks on 4/23/19.
//  Copyright © 2019 Johnny Hicks. All rights reserved.
//

import Foundation

class PlaceController {
    // This is our source of all truth
    private(set) var places: [Place] = []
    
    func createPlace(with name: String, latitude: Double, longitude: Double) {
        let place = Place(name: name, latitude: latitude, longitude: longitude)
        self.places.append(place)
    }
}
