//
//  File.swift
//  Robots
//
//  Created by Karen Karapetyan on 2/8/20.
//  Copyright © 2020 Karen Karapetyan. All rights reserved.
//

import Foundation

class Opponents {
    let robot1: Robot
    let robot2: Robot
    
    lazy var winner: Robot = {
        return (Int.random(in: 0...1) == 0) ? robot1 : robot2
    }()
    
    init(robot1: Robot, robot2: Robot) {
        self.robot1 = robot1
        self.robot2 = robot2
    }
    
    func isWinner(_ robot: Robot) -> Bool {
        return (winner == robot)
    }
}
