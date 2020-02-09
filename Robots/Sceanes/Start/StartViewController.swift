//
//  StartViewController.swift
//  Robots
//
//  Created by Karen Karapetyan on 2/7/20.
//  Copyright © 2020 Karen Karapetyan. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var leaderboardButton: UIButton!

    // MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupLeaderboardButton()
    }

    private func setupLeaderboardButton() {
        leaderboardButton.isHidden = !AppSettings.Danceoff.isFinished()
    }
}
