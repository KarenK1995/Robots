//
//  DanceoffMaker.swift
//  Robots
//
//  Created by Karen Karapetyan on 2/8/20.
//  Copyright © 2020 Karen Karapetyan. All rights reserved.
//

import Foundation

protocol DanceoffMakerDelegate: NSObjectProtocol {
    func danceoffMaker(_ danceoffMaker: DanceoffMaker, didStartDanceOff opponents: Opponents)
    func danceoffMaker(_ danceoffMaker: DanceoffMaker, didFinishDanceOff opponents: Opponents)
    
    func danceoffMaker(_ danceoffMaker: DanceoffMaker, didFinishAllDanceOffs allOpponents: [Opponents])
}

class DanceoffMaker {
    
    let team1: Robots
    let team2: Robots
    
    weak var delegate: DanceoffMakerDelegate?
    
    init(team1: Robots, team2: Robots) {
        self.team1 = team1
        self.team2 = team2
    }
    
    func startCompetition() {
        guard team1.count == team2.count else { return }
        let opponentCouples = team1.enumerated().map { Opponents(robot1: $1, robot2: team2[$0]) }
        
        opponentCouples.enumerated().forEach { (index, opponents) in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(index*2)) { [weak self] in
                
                guard let `self` = self else { return }
                self.delegate?.danceoffMaker(self, didStartDanceOff: opponents)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
                    guard let `self` = self else { return }
                    self.delegate?.danceoffMaker(self, didFinishDanceOff: opponents)
                    
                    let isLastIteration = (index == opponentCouples.count - 1)
                    if isLastIteration {
                        self.delegate?.danceoffMaker(self, didFinishAllDanceOffs: opponentCouples)
                    }
                }
            }
        }
    }
    
}
