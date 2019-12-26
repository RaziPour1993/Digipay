//
//  TrackTableViewCell.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/25/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import UIKit
import Kingfisher

class TrackTableViewCell: UITableViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistsLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var contentContainerView: UIView!
    
    var indexPath: IndexPath!
    var viewModel: TrackCellViewModel? {
        didSet {
            guard let viewModel = self.viewModel else {
                self.coverImageView.image = nil
                return
            }
            
            self.nameLabel.text = viewModel.name
            self.artistsLabel.text = viewModel.artists
            self.popularityLabel.text = viewModel.popularity.description
            
            let url = URL(string: viewModel.image)
            let processor = DownsamplingImageProcessor(size: CGSize(width: 50, height: 50)) >> RoundCornerImageProcessor(cornerRadius: 20)
            coverImageView.kf.indicatorType = .activity
            coverImageView.kf.setImage(
                with: url,
                placeholder: nil,
                options: [
                    .processor(processor),
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ])
            {
                result in
                switch result {
                case .success(let value): break
//                    print("Task done for: \(value.source.url?.absoluteString ?? "")")
                case .failure(let error): break
//                    print("Job failed: \(error.localizedDescription)")
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewCofig()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            self.viewModel?.delegate?.didSelect(index: indexPath)
        }
        
    }
    
    func viewCofig(){
        self.contentContainerView.layer.cornerRadius = 10
    }
    
    override func prepareForReuse() {
        self.viewModel = nil
    }
    
}

extension TrackTableViewCell: ConfigurableTableViewCell {
    
    func configure(with model: TableViewCellModel, indexPath: IndexPath) {
        guard let model = model as? TrackCellViewModel else { fatalError(self.description) }
        self.viewModel = model
        self.indexPath = indexPath
    }
    
}
