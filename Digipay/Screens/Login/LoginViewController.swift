//
//  LoginViewController.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/24/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    private weak var presenter: LoginPresenter?
    
    init(_ presenter: LoginPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
        self.presenter?.set(view: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter?.present()
    }
    
}

extension LoginViewController: LoginPresentingView {
    
    
}
