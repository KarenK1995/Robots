//
//  Robot.swift
//  Robots
//
//  Created by Karen Karapetyan on 2/4/20.
//  Copyright © 2020 Karen Karapetyan. All rights reserved.
//

import Foundation

struct Robot: Codable, Hashable {
    let id: Int
    let name, powermove: String
    let experience: Int
    let outOfOrder: Bool
    let avatar: String
}

typealias Robots = [Robot]
