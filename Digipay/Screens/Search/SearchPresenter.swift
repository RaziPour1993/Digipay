//
//  SearchPresenter.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/25/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import Foundation

protocol SearchPresenter: Presenter {
    func set(view: SearchPresentingView)
}

protocol SearchPresentingView: PresentingView {
    
}

protocol SearchScreenDelegate: class {
    
}
