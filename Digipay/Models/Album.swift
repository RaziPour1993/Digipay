//
//  Album.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/25/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Album {
    
    let artists: [Artist]
    let availableMarkets: [String]
    let id: String
    let image: String
    let name: String
    let releaseDate: Date?
    let totalTracks: Int
    
    enum CodingKeys: String, CodingKey {
        case artists = "artists"
        case availableMarkets = "available_markets"
        case id = "id"
        case images = "images"
        case name = "name"
        case releaseDate = "release_date"
        case totalTracks = "total_tracks"
    }
    
    init(_ json: JSON) {
        
        let artistsJson = json[CodingKeys.artists.rawValue].arrayValue
        self.artists = artistsJson.map { (item) -> Artist in return Artist(item) }
        
        let availableMarketJson = json[CodingKeys.artists.rawValue].arrayValue
        self.availableMarkets = availableMarketJson.map({ (item) -> String in return item.stringValue })
        
        self.id = json[CodingKeys.id.rawValue].stringValue
        self.name = json[CodingKeys.name.rawValue].stringValue
        self.releaseDate = json[CodingKeys.releaseDate.rawValue].stringValue.toDate(withFormat: "y-MM-dd")
        self.totalTracks = json[CodingKeys.totalTracks.rawValue].intValue
        self.image = json["images"].arrayValue.first?["url"].stringValue ?? ""
        
    }
    
}
