//
//  DanceoffTableViewCell.swift
//  Robots
//
//  Created by Karen Karapetyan on 2/4/20.
//  Copyright © 2020 Karen Karapetyan. All rights reserved.
//

import UIKit
import SDWebImage

class DanceoffTableViewCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var winnerImageView: UIImageView!
    @IBOutlet weak var winnerNameLabel: UILabel!
    @IBOutlet weak var winnerExperienceLabel: UILabel!
    
    @IBOutlet weak var loserImageView: UIImageView!
    @IBOutlet weak var loserNameLabel: UILabel!
    @IBOutlet weak var loserExperienceLabel: UILabel!
    
    //MARK: Constants & Variables
    static let reuseID = "DanceoffCell"
    
    var winnerRobot: Robot? {
        didSet {
            setupWinnerRobot()
        }
    }
    
    var loserRobot: Robot? {
        didSet {
            setupLoserRobot()
        }
    }

    //MARK: Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: Private Methods
    private func setupWinnerRobot() {
        guard let winnerRobot = winnerRobot else { return }
        let url = URL(string: winnerRobot.avatar)
        winnerImageView.sd_setImage(with: url, completed: nil)
        winnerNameLabel.text = winnerRobot.name
        winnerExperienceLabel.text = "Exp: \(winnerRobot.experience)"
    }
    
    private func setupLoserRobot() {
        guard let loserRobot = loserRobot else { return }
        let url = URL(string: loserRobot.avatar)
        loserImageView.sd_setImage(with: url, completed: nil)
        loserNameLabel.text = loserRobot.name
        loserExperienceLabel.text = "Exp: \(loserRobot.experience)"
    }
}
