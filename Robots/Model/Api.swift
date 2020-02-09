//
//  Api.swift
//  Robots
//
//  Created by Karen Karapetyan on 2/4/20.
//  Copyright © 2020 Karen Karapetyan. All rights reserved.
//

import Foundation
import Combine

struct Api {
    
    private init() {}
    
    static var danceOffsPopulated: AnyPublisher<DanceoffsPopulated, Never> {
        let url = Endpoint.danceOffsPopulated.url!
        return URLSession.shared.dataTaskPublisher(for: url)
        .map { $0.data }
        .decode(type: DanceoffsPopulated.self, decoder: JSONDecoder())
        .replaceError(with: [])
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
    static var robots: AnyPublisher<Robots, Never> {
        let url = Endpoint.robots.url!
        return URLSession.shared.dataTaskPublisher(for: url)
        .map { $0.data }
        .decode(type: Robots.self, decoder: JSONDecoder())
        .replaceError(with: [])
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
    static func uploadResult(danceOffs: DanceOffResults) -> AnyPublisher<Danceoffs, Error> {
        let url = Endpoint.uploadDanceoffs.url!
        var request = URLRequest(url: url)
        request.httpBody = try? JSONEncoder().encode(danceOffs)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return URLSession.shared.dataTaskPublisher(for: request)
        .map { $0.data }
        .decode(type: Danceoffs.self, decoder: JSONDecoder())
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
