//
//  DataMapViewController.swift
//  RoambeeDemo
//
//  Created by Nidhi Joshi on 26/09/2021.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class DataMapViewController: UIViewController,MKMapViewDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    // MARK: - Properties
    var objectAnnotation = MKPointAnnotation()
    var viewModel: DataMapViewModel?
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.viewDidLoad()
        
        
        showMapData()
    }
    
    func showMapData() {
        let latitude = viewModel?.latitude ?? 0.0
        let longitude = viewModel?.longitude ?? 0.0
        var theSpan:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latitude, longitudeDelta: longitude)
        
        var pointLocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)

        var region:MKCoordinateRegion = MKCoordinateRegion(center: pointLocation, span: theSpan)
        mapView?.setRegion(region, animated: true)

        var pinLocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            //CLLocationCoordinate2D(latitude: viewModel?.latitude, longitude: viewModel?.longitude)
        
        objectAnnotation.coordinate = pinLocation
        objectAnnotation.title = "Location"
        self.mapView?.addAnnotation(objectAnnotation)
    }
}
