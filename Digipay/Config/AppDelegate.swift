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
        
        let redirectURL: URL = URL(string: "dpg://mydigipay/")!
        SpotifyLogin.shared.configure(clientID: "ba05b9cd59634cefa8493ac961d76ed6",
                                      clientSecret: "80b7235a88264654a105a989f6775a59",
                                      redirectURL: redirectURL)
        
        SpotifyLogin.shared.getAccessToken { (accessToken, error) in
            if error != nil {
                // User is not logged in, show log in flow.
            }
        }
        
        config()
        start()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        let handled = SpotifyLogin.shared.applicationOpenURL(url) { (error) in
            print(error)
        }
        return handled
    }
    
    func config() {

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

