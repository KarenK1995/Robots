//
//  Danceoffs.swift
//  Robots
//
//  Created by Karen Karapetyan on 2/4/20.
//  Copyright © 2020 Karen Karapetyan. All rights reserved.
//

import Foundation

struct Danceoff: Codable {
    let id, winner, loser: Int
    let dancedAt: String
}

typealias Danceoffs = [Danceoff]
