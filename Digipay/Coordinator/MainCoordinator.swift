//
//  MainCoordinator.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/24/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import Foundation
import SpotifyLogin

final class MainCoordinator: Coordinator {
    
    var screenFactory: ScreenFactory
    var coordinatorFactory: CoordinatorFactory
    var router: Router
    
    init(_ coordinatorFactory: CoordinatorFactory, _ screenFactory: ScreenFactory, _ router: Router) {
        self.screenFactory = screenFactory
        self.coordinatorFactory = coordinatorFactory
        self.router = router
    }
    
    func start() {
        
        guard LocalDataManeger.shared.getToken() != nil  else {
            self.startLoginCoordinator()
            return
        }
        
        self.startSearchCoordinator()
        
    }
    
}

extension MainCoordinator: LoginCoordinatorDelegate {
    
    func didLogin(coordinator: LoginCoordinator) {
        self.coordinatorFactory.removeChildCoordinator(coordinator)
        startSearchCoordinator()
    }
    
    func startLoginCoordinator() {
        let coordinator = self.coordinatorFactory.makeLoginCoordinator(delegate: self)
        coordinator.start()
    }
    
}

extension MainCoordinator: SearchCoordinatorDelegate {
    
    func startSearchCoordinator() {
        let coordinator = self.coordinatorFactory.makeSearchCoordinator(delegate: self)
        coordinator.start()
    }
    
    func didSignOut(coordinator: SearchCoordinator) {
        self.coordinatorFactory.removeChildCoordinator(coordinator)
        startLoginCoordinator()
    }
    
}
