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
    func didEndSearchViewModel()
    func didSearch(text: String)
    func didRetry()
    func didSignOut()
}

protocol SearchPresentingView: PresentingView {
    func didUpdate(search viewModel: TableViewModel)
}

protocol SearchScreenDelegate: class {
    func didSelect(track: Track)
    func didSignOut()
}
