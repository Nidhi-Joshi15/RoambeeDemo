//
//  AppCoordinator.swift
//  RoambeeDemo
//
//  Created by Nidhi Joshi on 26/09/2021.
//

import Foundation
import UIKit

final class AppCoordinator {
    
    // MARK: - Properties
    
    private unowned var sceneDelegate: SceneDelegate
    
    private var tabcoordinator: TabCoordinator?
    
    // MARK: - Initializer
    
    init(sceneDelegate: SceneDelegate) {
        self.sceneDelegate = sceneDelegate
    }
    
    // MARK: - Coordinator
    
    func start() {
        tabcoordinator = TabCoordinator(presenter: sceneDelegate.window!)
        tabcoordinator?.start()
    }
}
