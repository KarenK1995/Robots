//
//  DanceoffPopulated.swift
//  Robots
//
//  Created by Karen Karapetyan on 2/4/20.
//  Copyright © 2020 Karen Karapetyan. All rights reserved.
//

import Foundation

struct DanceoffPopulated: Codable {
    let id: Int
    let dancedAt: String
    let winner, loser: Robot
}

typealias DanceoffsPopulated = [DanceoffPopulated]
