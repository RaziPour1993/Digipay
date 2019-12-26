//
//  Date.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/25/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import Foundation

extension Date {
    
    func toString(withFormat format: String = "MMM d,yyyy HH:m") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = .current
        dateFormatter.locale = .current
        let str = dateFormatter.string(from: self)
        return str
    }
    
}
