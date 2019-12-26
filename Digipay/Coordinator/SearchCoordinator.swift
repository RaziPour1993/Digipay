//
//  SearchCoordinator.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/25/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import Foundation

import Foundation

protocol SearchCoordinatorDelegate: class {
    func didSignOut(coordinator: SearchCoordinator)
}

final class SearchCoordinator: Coordinator {
    
    var screenFactory: ScreenFactory
    var coordinatorFactory: CoordinatorFactory
    var router: Router
    weak var delegate: SearchCoordinatorDelegate?
    
    init(_ coordinatorFactory: CoordinatorFactory, _ screenFactory: ScreenFactory, _ router: Router, _ delegate: SearchCoordinatorDelegate) {
        self.screenFactory = screenFactory
        self.coordinatorFactory = coordinatorFactory
        self.router = router
        self.delegate = delegate
    }
    
    func start() {
        displaySearchScreen()
    }
    
}

extension SearchCoordinator: SearchScreenDelegate {
    
    func didSelect(track: Track) {
        print("didSelect", track.name)
    }
    
    func didSignOut() {
        self.delegate?.didSignOut(coordinator: self)
    }
    
    func displaySearchScreen(){
        let vc = self.screenFactory.makeSearchScreen(delegate: self)
        self.router.setRoot(vc, withNavigation: true)
    }
    
}
