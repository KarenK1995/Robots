//
//  RobotCollectionViewCell.swift
//  Robots
//
//  Created by Karen Karapetyan on 2/8/20.
//  Copyright © 2020 Karen Karapetyan. All rights reserved.
//

import UIKit
import SDWebImage

class RobotCollectionViewCell: UICollectionViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    //MARK: Variables & Constants
    static let reuseID = "RobotCell"
    
    var robot: Robot? {
        didSet {
            setupRobotContent()
        }
    }

    //MARK: Methods
    private func setupRobotContent() {
        guard let robot = robot else { return }
        let url = URL(string: robot.avatar)
        imageView.sd_setImage(with: url, completed: nil)
        nameLabel.text = robot.name
    }
}
