//
//  DanceoffsViewController.swift
//  Robots
//
//  Created by Karen Karapetyan on 2/4/20.
//  Copyright © 2020 Karen Karapetyan. All rights reserved.
//

import UIKit

class DanceoffsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension DanceoffsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
