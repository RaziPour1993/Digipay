//
//  Artist.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/25/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Artist {
    
    let id: String
    let name: String
    
    enum CodingKeys: String {
        case id = "id"
        case name = "name"
    }
    
    init(_ json: JSON) {
        self.id = json[CodingKeys.id.rawValue].stringValue
        self.name = json[CodingKeys.name.rawValue].stringValue
    }
}
