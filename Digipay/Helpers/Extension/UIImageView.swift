//
//  UIImageView.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/26/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(url: String, completion: @escaping (Result<Bool, Error>)->Void) {
        
        let url = URL(string: url)
        let processor = DownsamplingImageProcessor(size: CGSize(width: 50, height: 50)) >> RoundCornerImageProcessor(cornerRadius: 20)
        self.kf.indicatorType = .activity
        self.kf.setImage(
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
            case .success:
                completion(.success(true))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
