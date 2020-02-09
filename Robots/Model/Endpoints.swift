//
//  Endpoints.swift
//  Robots
//
//  Created by Karen Karapetyan on 2/4/20.
//  Copyright © 2020 Karen Karapetyan. All rights reserved.
//

import Foundation

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]?
}

extension Endpoint {
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "challenge.parkside-interactive.com"
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
}

extension Endpoint {
    
    static var robots: Endpoint {
        let path = "/api/robots"
        return Endpoint(path: path, queryItems: nil)
    }
    
    static var danceOffsPopulated: Endpoint {
        let path = "/api/danceoffs/populated"
        return Endpoint(path: path, queryItems: nil)
    }
    
    static var uploadDanceoffs: Endpoint {
        let path = "/api/danceoffs"
        return Endpoint(path: path, queryItems: nil)
    }
}
