//
//  SearchRepository.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/25/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import Foundation
import SwiftyJSON


protocol SearchRepository {
    func searchTracks(info: SearchTrack, completion: @escaping(Result<Tracks, NetworkResponseStatus>)-> Void)
}



extension RepositoryIMP: SearchRepository {
    
    func searchTracks(info: SearchTrack, completion: @escaping (Result<Tracks, NetworkResponseStatus>) -> Void) {
        self.networkManeger.request(MainHttpRequestIMP.search(info)) { (result) in
            switch result {
            case .success(let data):
                let json = try! JSON(data: data!)
                let itemsJson = json["tracks"]["items"].arrayValue
                let items = itemsJson.map { (json) -> Track in return Track(json)}
                completion(.success(items))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
