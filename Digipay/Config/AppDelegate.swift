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
    private var rootController: UINavigationController { return self.window!.rootViewController as! UINavigationController }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        start()
        return true
    }
    
    private func start(){
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController()
        window?.makeKeyAndVisible()
        let router = MainRouter(rootController: self.rootController, window: self.window)
        applicationCoordinator = MainCoordinator(router: router)
        applicationCoordinator.start()
    }
    
}

