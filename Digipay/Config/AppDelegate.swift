//
//  AppDelegate.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/24/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import UIKit
import SpotifyLogin

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private var applicationCoordinator: Coordinator!
    private var coordinatorFactory: CoordinatorFactory!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        config()
        start()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        let handled = SpotifyLogin.shared.applicationOpenURL(url) { _ in }
        return handled
    }
    
    func config() {
        let redirectURL: URL = URL(string: Constant.redirectURL.value)!
        SpotifyLogin.shared.configure(clientID: Constant.clientID.value, clientSecret: Constant.clientSecret.value, redirectURL: redirectURL)
    }
    
    private func start(){
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController()
        window?.makeKeyAndVisible()
        
        let screenFactory = MainScreenFactory()
        
        let rootVC = self.window!.rootViewController as! UINavigationController
        let router = MainRouter(rootController: rootVC, window: self.window)
        
        self.coordinatorFactory = MainCoordinatorFactory(screenFactory: screenFactory, router: router)
        
        applicationCoordinator = coordinatorFactory.makeMainCoordinator()
        applicationCoordinator.start()
    }
    
}

