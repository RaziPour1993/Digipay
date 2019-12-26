//
//  SearchViewModel.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/25/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import Foundation

protocol SearchViewModelDelegate: class {
    func didSelect(track: Track)
}

class SearchViewModel: TableViewModel {
    
    var sections: [TableViewSectionModel]!
    weak var delegate: SearchViewModelDelegate?
    
    init(delegate: SearchViewModelDelegate) {
        self.delegate = delegate
        self.sections = []
    }
    
    func set(tracks: Tracks) {
        let cells = tracks.map { (item) -> TableViewCellModel in return TrackCellViewModel(item, delegate: self) }
        let section = TableViewSection(cellModels: cells)
        self.sections = [section]
    }
    
}

extension SearchViewModel: TrackCellViewModelDelegate {
    
    func didSelect(track: Track, index: IndexPath) {
        self.delegate?.didSelect(track: track)
    }
}
