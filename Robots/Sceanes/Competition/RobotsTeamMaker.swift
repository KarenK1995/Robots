//
//  TeamMaker.swift
//  Robots
//
//  Created by Karen Karapetyan on 2/8/20.
//  Copyright © 2020 Karen Karapetyan. All rights reserved.
//

import Foundation

class RobotsTeamMaker {
    
    let robots: Robots
    let maxExperience: Int
    let membersCount: Int
    
    var team1: Robots?
    var team2: Robots?
    
    init(robots: Robots, maxExperience: Int, membersCount: Int) {
        self.robots = robots.filter { !$0.outOfOrder }
        self.maxExperience = maxExperience
        self.membersCount = membersCount
        
        createFirstTeam()
        createSecondTeam()
    }
    
    func createFirstTeam() {
        var teamIsInvalid = true
        while teamIsInvalid {
            team1 = robots.random(n: membersCount)
            teamIsInvalid = !isValidTeam(robots: team1!)
        }
    }
    
    func createSecondTeam() {
        var teamIsInvalid = true
        while teamIsInvalid {
            team2 = robotsForSecondTeam().random(n: membersCount)
            teamIsInvalid = !isValidTeam(robots: team2!)
        }
    }
    
    func robotsForSecondTeam() -> Robots {
        guard let team1 = team1 else { return [] }
        let robotsForSecondTeam = Set(robots).subtracting(team1)
        return Array(robotsForSecondTeam)
    }
    
    func isValidTeam(robots: Robots) -> Bool {
        let totalExperience = robots.map { $0.experience }.reduce(0, +)
        return (totalExperience < maxExperience)
    }
}
