//
//  Endpoints.swift
//  Beer List
//
//  Created by Amadeu Cavalcante on 08/12/2017.
//  Copyright © 2017 Amadeu Cavalcante. All rights reserved.
//

import Foundation

struct API {
    static let baseUrl = "https://api.punkapi.com/v2/"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    
    enum Beers: Endpoint {
        case fetch
        
        public var path: String {
            switch self {
            case .fetch: return "/beers"
            }
        }
        
        public var url: String {
            switch self {
            case .fetch: return "\(API.baseUrl)\(path)"
            }
        }
    }
}
