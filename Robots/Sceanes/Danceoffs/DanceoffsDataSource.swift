//
//  Danceoffs.swift
//  Robots
//
//  Created by Karen Karapetyan on 2/4/20.
//  Copyright © 2020 Karen Karapetyan. All rights reserved.
//

import UIKit

class DanceoffsDataSource: NSObject ,UITableViewDataSource {
    
    var danceoffs: DanceoffsPopulated = [] {
        didSet {
            tableView?.reloadData()
        }
    }
    
    weak var tableView: UITableView?
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return danceoffs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseId = DanceoffTableViewCell.reuseID
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId) as! DanceoffTableViewCell
        cell.winnerRobot = danceoffs[indexPath.row].winner
        cell.loserRobot = danceoffs[indexPath.row].loser
        return cell
    }
}
