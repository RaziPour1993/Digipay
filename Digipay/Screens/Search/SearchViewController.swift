//
//  SearchViewController.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/25/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    var presenter: SearchPresenter?
    
    init(_ presenter: SearchPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
        self.presenter?.set(view: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        presenter?.present()
    }
    
    func config(){
        
    }
    
}

extension SearchViewController: SearchPresentingView {
    
    
}
