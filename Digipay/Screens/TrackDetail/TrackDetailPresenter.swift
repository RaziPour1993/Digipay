//
//  TrackDetailPresenter.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/25/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import Foundation

protocol TrackDetailPresenter: Presenter {
    func set(view: TrackDetailPresentingView)
}

protocol TrackDetailPresentingView: PresentingView {
    func update(track: Track)
}

protocol TrackDetailScreenDelegate: class {
    
}
