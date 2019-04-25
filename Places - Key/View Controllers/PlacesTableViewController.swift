//
//  PlacesTableViewController.swift
//  Places - Key
//
//  Created by Johnny Hicks on 4/23/19.
//  Copyright © 2019 Johnny Hicks. All rights reserved.
//

import UIKit

class PlacesTableViewController: UITableViewController {
    
    let placeController = PlaceController()
    // MARK: - IBOutlets
    @IBOutlet weak var locationNameTextField: UITextField!
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var longitudeTextfield: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.placeController.places.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath)

        let place = self.placeController.places[indexPath.row]
        
        cell.textLabel?.text = place.name

        return cell
    }
 

    @IBAction func savePlaceButtonTapped(_ sender: Any) {
        guard let name = locationNameTextField.text,
            let latitudeString = latitudeTextField.text,
            let longitudeString = longitudeTextfield.text,
            let latitude = Double(latitudeString),
            let longitude = Double(longitudeString) else { return }
        
        placeController.createPlace(with: name, latitude: latitude, longitude: longitude)
        
        tableView.reloadData()
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPlace" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let mapViewController = segue.destination as? MapViewController else { return }
            let place = self.placeController.places[indexPath.row]
            mapViewController.place = place
        }
    }
 

}
