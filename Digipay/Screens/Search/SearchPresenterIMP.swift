//
//  SearchPresenterIMP.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/25/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import Foundation

class SearchPresenterIMP {
    
    private weak var delegate: SearchScreenDelegate?
    private weak var view: SearchPresentingView?
    private var repository: SearchRepository
    
    init(delegate: SearchScreenDelegate, _ repository: SearchRepository) {
        self.delegate = delegate
        self.repository = repository
    }
    
}

extension SearchPresenterIMP: SearchPresenter {
    
    func set(view: SearchPresentingView) {
        self.view = view
    }
    
    func present() {
        
    }
    
}

extension SearchPresenterIMP {
    
    func getTracks(){
        
        
    }
    
}
