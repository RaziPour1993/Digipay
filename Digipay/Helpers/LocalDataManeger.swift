//
//  UserDefaultsManeger.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/25/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import Foundation

class LocalDataManeger {
    
    static let shared = LocalDataManeger()
    
    private var userDefault: UserDefaults
    
    private enum UserDefaultsKey {
        case token
        
        var key: String {
            return "\(self)"
        }
    }
    
    private init() {
        self.userDefault = UserDefaults.standard
    }
    
    func set(token: String) {
        self.userDefault.set(token, forKey: UserDefaultsKey.token.key)
    }
    
    func getToken()-> String? {
        self.userDefault.value(forKey: UserDefaultsKey.token.key) as? String
    }
    
    func removeToken() {
        self.userDefault.removeObject(forKey: UserDefaultsKey.token.key)
    }
    
}
