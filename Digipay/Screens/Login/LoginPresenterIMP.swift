//
//  LoginPresenterIMP.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/24/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import Foundation

class LoginPresenterIMP {
    
    private weak var delegate: LoginScreenDelegate?
    private weak var view: LoginPresentingView?
    
    init(delegate: LoginScreenDelegate) {
        self.delegate = delegate
    }
    
}

extension LoginPresenterIMP: LoginPresenter {
    
    func set(view: LoginPresentingView) {
        self.view = view
    }
    
    func present() {
        
    }
    
}
