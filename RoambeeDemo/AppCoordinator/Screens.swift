//
//  Screens.swift
//  RoambeeDemo
//
//  Created by Nidhi Joshi on 26/09/2021.
//

import Foundation
import CoreBluetooth
import UIKit

final class Screens {
    
    // MARK: - Properties
    
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: Screens.self))
}

// MARK: - FirstViewController

extension Screens {
    func createFirstViewController() -> UIViewController {
        
        let viewController = storyboard.instantiateViewController(identifier: "DeviceViewController") as? DeviceViewController
        let viewModel = DeviceListViewModel()
        viewController?.viewModel = viewModel
        return viewController ?? UIViewController()
    }
}

// MARK: - SecondViewController

extension Screens {
    func createSecondViewController() -> UIViewController {
        let viewController = storyboard.instantiateViewController(identifier: "DataListViewController") as! DataListViewController
        let viewModel = DataListViewModel()
        viewController.viewModel = viewModel
        return viewController
    }
}
extension Screens {
    func createDataMapViewController(lat: Double, lng: Double) -> UIViewController {
        let viewController = storyboard.instantiateViewController(identifier: "DataMapViewController") as! DataMapViewController
        let viewModel = DataMapViewModel(lat: lat, lng: lng)
        viewController.viewModel = viewModel
        return viewController
    }
}
