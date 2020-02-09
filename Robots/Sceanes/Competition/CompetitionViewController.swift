//
//  CompetitionViewController.swift
//  Robots
//
//  Created by Karen Karapetyan on 2/7/20.
//  Copyright © 2020 Karen Karapetyan. All rights reserved.
//

import UIKit
import Combine
import SDWebImage

class CompetitionViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var team1View: TeamView!
    @IBOutlet weak var team2View: TeamView!
    
    @IBOutlet weak var opponent1ImageView: UIImageView!
    @IBOutlet weak var opponent1ResultLabel: UILabel!
    
    @IBOutlet weak var opponent2ImageView: UIImageView!
    @IBOutlet weak var opponent2ResultLabel: UILabel!
    
    //MARK: Variables
    var cancellableRequest: AnyCancellable?
    
    var robots: Robots = [] {
        didSet {
            createTeams()
            startCompetition()
        }
    }
    
    var team1: Robots = [] {
        didSet {
            team1View.robots = team1
        }
    }
    
    var team2: Robots = [] {
        didSet {
            team2View.robots = team2
        }
    }
    
    var danceOffMaker: DanceoffMaker?

    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchRobots()
    }
    
    //MARK: Methods
    private func fetchRobots() {
        cancellableRequest = Api.robots
            .assign(to: \.robots, on: self)
    }
    
    private func createTeams() {
        let teamMaker = RobotsTeamMaker(robots: robots, maxExperience: 50, membersCount: 5)
        team1 = teamMaker.team1 ?? []
        team2 = teamMaker.team2 ?? []
    }
    
    private func startCompetition() {
        let danceOffMaker = DanceoffMaker(team1: team1, team2: team2)
        danceOffMaker.delegate = self
        danceOffMaker.startCompetition()
        self.danceOffMaker = danceOffMaker
    }
    
    private func hideCometitionResultLables() {
        opponent1ResultLabel.isHidden = true
        opponent2ResultLabel.isHidden = true
    }
    
    private func showCometitionResultLables() {
        opponent1ResultLabel.isHidden = false
        opponent2ResultLabel.isHidden = false
    }
    
    private func hideOpponentImages() {
        opponent1ImageView.isHidden = true
        opponent2ImageView.isHidden = true
    }
    
    private func setOpponentImages(opponents: Opponents) {
        opponent1ImageView.image = nil
        let opponent1ImageURL = URL(string: opponents.robot1.avatar)
        opponent1ImageView.sd_setImage(with: opponent1ImageURL, completed: nil)
        
        opponent2ImageView.image = nil
        let opponent2ImageURL = URL(string: opponents.robot2.avatar)
        opponent2ImageView.sd_setImage(with: opponent2ImageURL, completed: nil)
    }
    
    private func setOpponentsResults(opponents: Opponents) {
        opponent1ResultLabel.text = opponents.isWinner(opponents.robot1) ? "Winner" : "Loser"
        opponent1ResultLabel.textColor = opponents.isWinner(opponents.robot1) ? .green : .red
        
        opponent2ResultLabel.text = opponents.isWinner(opponents.robot2) ? "Winner" : "Loser"
        opponent2ResultLabel.textColor = opponents.isWinner(opponents.robot2) ? .green : .red
    }
    
    private func hideOpponents() {
        hideCometitionResultLables()
        hideOpponentImages()
    }
    
    private func uploadDanceOffResults(opponents: [Opponents]) {
        let result = opponents.map {
            DanceoffResult(winner: $0.winner.id, opponents: [$0.robot1.id, $0.robot2.id])
        }
        cancellableRequest = Api.uploadResult(danceOffs: DanceOffResults(danceoffs: result))
            .sink(receiveCompletion: { (error) in
                print(error)
            }, receiveValue: { (result) in
                print(result)
            })
    }
}

extension CompetitionViewController: DanceoffMakerDelegate {
    
    func danceoffMaker(_ danceoffMaker: DanceoffMaker, didStartDanceOff opponents: Opponents) {
        hideCometitionResultLables()
        setOpponentImages(opponents: opponents)
    }
    
    func danceoffMaker(_ danceoffMaker: DanceoffMaker, didFinishDanceOff opponents: Opponents) {
        showCometitionResultLables()
        setOpponentsResults(opponents: opponents)
    }
    
    func danceoffMaker(_ danceoffMaker: DanceoffMaker, didFinishAllDanceOffs allOpponents: [Opponents]) {
        hideOpponents()
        uploadDanceOffResults(opponents: allOpponents)
        AppSettings.Danceoff.setFinished(true)
    }
}
