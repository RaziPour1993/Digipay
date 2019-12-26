//
//  TrackDetailPresenterIMP.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/25/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import Foundation
import SpotifyLogin

class TrackDetailPresenterIMP {
    
    private weak var delegate: TrackDetailScreenDelegate?
    private weak var view: TrackDetailPresentingView?
    private var track: Track
    
    init(delegate: TrackDetailScreenDelegate, track: Track) {
        self.track = track
        self.delegate = delegate
    }
    
}

extension TrackDetailPresenterIMP: TrackDetailPresenter {
    
    func set(view: TrackDetailPresentingView) {
        self.view = view
    }
    
    func present() {
        self.view?.update(track: track)
    }
    
}
