//
//  DataMapViewModel.swift
//  RoambeeDemo
//
//  Created by Nidhi Joshi on 26/09/2021.
//

import Foundation

final class DataMapViewModel: DataMapViewModelProtocol {
    var latitude: Double
    
    var longitude: Double
    
    init(lat: Double, lng: Double) {
        latitude = lat
        longitude = lng
    }
    
    func viewDidLoad() {
        
    }
    
    // MARK: - Inputs
    
}
protocol DataMapViewModelProtocol {
    var latitude: Double{ get set }
    var longitude: Double { get set }
}

 
