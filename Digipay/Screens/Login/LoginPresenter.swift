//
//  LoginPresenter.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/24/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import Foundation

protocol LoginPresenter: Presenter {
    func set(view: LoginPresentingView)
}

protocol LoginPresentingView: PresentingView {
    
}

protocol LoginScreenDelegate: class {
    func didLogin()
}
