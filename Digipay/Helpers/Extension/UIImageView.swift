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
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: url,
            placeholder: UIImage(named: "file-spotify-logo-png-4"),
            options: [
                .scaleFactor(UIScreen.main.scale),
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
