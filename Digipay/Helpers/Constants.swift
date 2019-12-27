//
//  Constants.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/26/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import Foundation

enum Constant {
    case backendServer
    case redirectURL
    case clientID
    case clientSecret
    
    var value: String {
        return Bundle.main.object(forInfoDictionaryKey: "\(self)") as! String
    }
}
