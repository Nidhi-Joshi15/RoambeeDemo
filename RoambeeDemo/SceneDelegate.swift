//
//  SceneDelegate.swift
//  RoambeeDemo
//
//  Created by Nidhi Joshi on 26/09/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var coordinator: AppCoordinator!
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        window!.makeKeyAndVisible()
        
        coordinator = AppCoordinator(sceneDelegate: self)
        coordinator.start()
    }
}

