//
//  MapViewController.swift
//  Places - Key
//
//  Created by Johnny Hicks on 4/23/19.
//  Copyright © 2019 Johnny Hicks. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    // MARK: - Properties and IBOutlets
    var place: Place? {
        didSet {
            updateMapLocation()
        }
    }
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.updateMapLocation()
    }
    
    private func updateMapLocation() {
        guard let place = place,
            isViewLoaded else { return }
        
        let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        let coordinate = CLLocationCoordinate2D(latitude: place.location.latitude, longitude: place.location.longitude)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        mapView.setRegion(region, animated: true)
    }
}
