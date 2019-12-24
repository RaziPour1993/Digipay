//
//  AppDelegate.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/24/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private var applicationCoordinator: Coordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        start()
        return true
    }
    
    func config() {
        
    }
    
    private func start(){
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController()
        window?.makeKeyAndVisible()
        
        let rootVC = self.window!.rootViewController as! UINavigationController
        let router = MainRouter(rootController: rootVC, window: self.window)
        let coordinatorFactory = MainCoordinatorFactory()
        let screenFactory = MainScreenFactory()
        
        applicationCoordinator = MainCoordinator(coordinatorFactory, screenFactory, router)
        applicationCoordinator.start()
    }
    
}

