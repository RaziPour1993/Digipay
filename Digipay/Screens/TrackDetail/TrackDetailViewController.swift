//
//  TrackDetailViewController.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/26/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import UIKit

class TrackDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistsLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    var presenter: TrackDetailPresenter?
    
    init(_ presenter: TrackDetailPresenter) {
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
    
}

extension TrackDetailViewController {
    
    func config(){
        self.navigationItem.title = "TrackDetail".localized
        self.artistsLabel.numberOfLines = 0
        self.nameLabel.numberOfLines = 0
    }
    
}

extension TrackDetailViewController: TrackDetailPresentingView {
    
    func update(track: Track) {
        self.coverImageView.setImage(url: track.album.image) { _ in }
        self.nameLabel.text = track.name
        self.artistsLabel.text = track.artistsJoined
        self.popularityLabel.text = track.popularity.description
        self.releaseDateLabel.text = track.album.releaseDate?.toString(withFormat: "y MMM")
    }
}

