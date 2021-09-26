//
//  DataListCoordinator.swift
//  RoambeeDemo
//
//  Created by Nidhi Joshi on 26/09/2021.
//

import Foundation
import UIKit

final class DataListCoordinator {
    
    // MARK: - Properties
    
    private let presenter: UINavigationController
    
    private let screens: Screens
    
    // MARK: - Initializer
    
    init(presenter: UINavigationController, screens: Screens) {
        self.presenter = presenter
        self.screens = screens
    }
    
    // MARK: - Coordinator
    
    func start() {
        showSecondViewController()
    }
    
    func getPresetnterCount() -> Int {
        return presenter.viewControllers.count
    }
    
    private func showSecondViewController() {
        let vc = presenter.viewControllers.filter({$0 is DataListViewController})
        
        if vc.count == 0 {
            let viewController = screens.createSecondViewController()
            (viewController as? DataListViewController)?.coordinator = self
            presenter.viewControllers = [viewController]
        }
    }
    
    func moveToSecondView(latitude: Double, longitude: Double) {
        let viewController = screens.createDataMapViewController(lat: latitude, lng: longitude)
        presenter.pushViewController(viewController, animated: true)
    }
}
