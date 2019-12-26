//
//  HttpRequest.swift
//  AvidAdvice
//
//  Created by Mohammad Razipour on 5/6/19.
//  Copyright © 2019 Resource Impact. All rights reserved.
//

import Foundation
import Alamofire

enum MainHttpRequestIMP: HttpRequest {
    
    case search(_ info: ParametersGetter)
    
    private var environment: String {
        return "https://api.spotify.com"
    }
    
    var path: String {
        switch self {
        case .search: return "https://api.spotify.com/v1/search"
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .search:
            return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .search(let info): return info.getParameters()
        default: return [:]
        }
    }
    
    var headers: Headers? {
        if let token = LocalDataManeger.shared.getToken() {
            return ["Authorization": "Bearer " + token]
        }
        return nil
    }
    
    var encoding: ParameterEncoding {
        switch  self {
        case .search:
            return URLEncoding.default
        default:
            return URLEncoding.default
        }
    }
    
}
