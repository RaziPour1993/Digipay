//
//  SearchPresenterIMP.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/25/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import Foundation
import SpotifyLogin

class SearchPresenterIMP {
    
    private weak var delegate: SearchScreenDelegate?
    private weak var view: SearchPresentingView?
    private var repository: SearchRepository
    private var tracks: Tracks
    private var searchViewModel: SearchViewModel!
    private var searchTrack: SearchTrack
    
    init(delegate: SearchScreenDelegate, _ repository: SearchRepository) {
        self.repository = repository
        self.searchTrack = SearchTrack()
        self.tracks = []
        self.searchViewModel = SearchViewModel(delegate: self)
        self.delegate = delegate
    }
    
}

extension SearchPresenterIMP: SearchPresenter {
    
    func set(view: SearchPresentingView) {
        self.view = view
    }
    
    func present() {
        
    }
    
    func didRetry() {
        self.getTracks(info: self.searchTrack)
    }
    
    func didEndSearchViewModel() {
        self.searchTrack.set(offset: self.tracks.count)
        self.getTracks(info: self.searchTrack)
    }
    
    func didSearch(text: String) {
        self.tracks = []
        configSeachViewModel()
        self.searchTrack.set(text: text)
        if !text.isEmpty {
            self.getTracks(info: searchTrack)
        }
    }
    
    func didSignOut() {
        LocalDataManeger.shared.removeToken()
        SpotifyLogin.shared.logout()
        self.delegate?.didSignOut()
    }
    
}

extension SearchPresenterIMP: SearchViewModelDelegate {
    
    func didSelect(track: Track) {
        self.delegate?.didSelect(track: track)
    }
    
    func getTracks(info: SearchTrack){
        self.view?.willLoadingData()
        self.repository.searchTracks(info: info) { (result) in
            self.view?.didLoadingData()
            switch result {
            case .success(let items):
                self.tracks.append(contentsOf: items)
                self.configSeachViewModel()
            case .failure(let error):
                self.view?.warning(message: error.description)
            }
        }
    }
    
    func configSeachViewModel() {
        self.searchViewModel.set(tracks: self.tracks)
        self.view?.didUpdate(search: self.searchViewModel)
    }
    
}
