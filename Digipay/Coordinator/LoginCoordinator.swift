//
//  LoginCoordinator.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/24/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import Foundation

protocol LoginCoordinatorDelegate: class {
    
}

final class LoginCoordinator: Coordinator {
    
    var screenFactory: ScreenFactory
    var coordinatorFactory: CoordinatorFactory
    var router: Router
    
    init(_ coordinatorFactory: CoordinatorFactory, _ screenFactory: ScreenFactory, _ router: Router) {
        self.screenFactory = screenFactory
        self.coordinatorFactory = coordinatorFactory
        self.router = router
    }
    
    func start() {
        displayLoginScreen()
    }
    
}

extension LoginCoordinator: LoginScreenDelegate {
    
    func displayLoginScreen(){
        let vc = self.screenFactory.makeLoginScreen(delegate: self)
        self.router.setRootModule(vc)
    }
    
}
