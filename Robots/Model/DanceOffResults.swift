//
//  DanceOffReults.swift
//  Robots
//
//  Created by Karen Karapetyan on 2/8/20.
//  Copyright © 2020 Karen Karapetyan. All rights reserved.
//

import Foundation

struct DanceOffResults: Codable {
    let danceoffs: [Danceoff]
}

struct Danceoff: Codable {
    let winner: Int
    let opponents: [Int]
}
