//
//  LoginCoordinator.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/24/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import Foundation

protocol LoginCoordinatorDelegate: class {
    func didLogin(coordinator: LoginCoordinator)
}

final class LoginCoordinator: Coordinator {
    
    var screenFactory: ScreenFactory
    var coordinatorFactory: CoordinatorFactory
    var router: Router
    weak var delegate: LoginCoordinatorDelegate?
    
    init(_ coordinatorFactory: CoordinatorFactory, _ screenFactory: ScreenFactory, _ router: Router, _ delegate: LoginCoordinatorDelegate) {
        self.screenFactory = screenFactory
        self.coordinatorFactory = coordinatorFactory
        self.router = router
        self.delegate = delegate
    }
    
    func start() {
        displayLoginScreen()
    }
    
}

extension LoginCoordinator: LoginScreenDelegate {
    
    func didLogin() {
        self.delegate?.didLogin(coordinator: self)
    }
    
    func displayLoginScreen(){
        let vc = self.screenFactory.makeLoginScreen(delegate: self)
        self.router.setRoot(vc)
    }
    
}
