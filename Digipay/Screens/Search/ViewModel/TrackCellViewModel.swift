//
//  TrackCellViewModel.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/25/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import Foundation

protocol TrackCellViewModelDelegate: class {
    func didSelect(track: Track, index: IndexPath)
}

class TrackCellViewModel: TableViewCellModel {
    
    func identifier() -> String {
        return "TrackTableViewCell"
    }
    
    var track: Track
    weak var delegate: TrackCellViewModelDelegate?
    
    var name: String
    var image: String
    var artists: String
    var popularity: Int
    
    init(_ track: Track, delegate: TrackCellViewModelDelegate) {
        self.delegate = delegate
        self.track = track
        self.name = track.name
        self.image = track.album.image
        self.artists = track.artists.map({ (item) -> String in return item.name }).joined(separator: ", ")
        self.popularity = track.popularity
    }
    
}
