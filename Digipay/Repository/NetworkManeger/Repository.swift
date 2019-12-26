//
//  Repository.swift
//  AvidAdvice
//
//  Created by Mohammad Razipour on 12/10/19.
//  Copyright © 2019 Resource Impact. All rights reserved.
//

import Foundation

class Repository {
    
    static let shared = Repository()
    private(set) var networkManeger: NetworkManeger
    
    init() {
        self.networkManeger = NetworkManegerImp()
    }
    
    
}

