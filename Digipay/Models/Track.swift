//
//  Track.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/25/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import Foundation
import SwiftyJSON

typealias Tracks = [Track]

struct Track {
    
    let album: Album
    let artists: [Artist]
    let availableMarkets: [String]
    let id: String
    let name: String
    let popularity: Int
    
    enum CodingKeys: String, CodingKey {
        case album = "album"
        case artists = "artists"
        case availableMarkets = "available_markets"
        case id = "id"
        case name = "name"
        case popularity = "popularity"
    }
    
    init(_ json: JSON) {
        self.album = Album(json[CodingKeys.album.rawValue])
        let artistsJson = json[CodingKeys.artists.rawValue].arrayValue
        self.artists = artistsJson.map { (item) -> Artist in return Artist(item) }
        let availableMarketJson = json[CodingKeys.artists.rawValue].arrayValue
        self.availableMarkets = availableMarketJson.map({ (item) -> String in return item.stringValue })
        self.id = json[CodingKeys.id.rawValue].stringValue
        self.name = json[CodingKeys.name.rawValue].stringValue
        self.popularity = json[CodingKeys.popularity.rawValue].intValue
    }
    
    var artistsJoined: String {
        return self.artists.map({ (item) -> String in return item.name }).joined(separator: ", ")
    }
    
}


