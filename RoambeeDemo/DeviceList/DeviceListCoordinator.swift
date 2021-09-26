//
//  DeviceListCoordinator.swift
//  RoambeeDemo
//
//  Created by Nidhi Joshi on 26/09/2021.
//

import Foundation
import UIKit

final class DeviceListCoordinator {
    
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
        showFirstViewController()
    }
    
    private func showFirstViewController() {
        let viewController = screens.createFirstViewController()
        presenter.viewControllers = [viewController]
    }
   
}
