//
//  MainCoordinator.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/24/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import Foundation

final class MainCoordinator: Coordinator {
    
    var screenFactory: ScreenFactory
    var coordinatorFactory: CoordinatorFactory
    var router: Router
    
    init(router: Router) {
        self.screenFactory = MainScreenFactory()
        self.coordinatorFactory = MainCoordinatorFactory()
        self.router = router
    }
    
    func start() {
        
    }
    
}
