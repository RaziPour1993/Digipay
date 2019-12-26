//
//  SearchTrack.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/25/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import Foundation

struct SearchTrack: ParametersGetter {
    
    private var limit: Int
    private var offset: Int
    private var type: String
    private var text: String
    
    mutating func set(offset: Int) {
        self.offset = offset
    }
    
    mutating func set(text: String){
        self.text = text
        self.offset = 0
    }
    
    init() {
        self.limit = 20
        self.offset = 0
        self.type = "track"
        self.text = ""
    }
    
    func getParameters() -> Parameters {
        var param = Parameters()
        param["q"] = self.text
        param["limit"] = self.limit
        param["offset"] = self.offset
        param["type"] = self.type
        return param
    }
    
    
}
