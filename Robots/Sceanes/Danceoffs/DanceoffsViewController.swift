//
//  DanceoffsViewController.swift
//  Robots
//
//  Created by Karen Karapetyan on 2/4/20.
//  Copyright © 2020 Karen Karapetyan. All rights reserved.
//

import UIKit
import Combine

class DanceoffsViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Variabls
    var dataSource: DanceoffsDataSource!
    var cancellableRequest: AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    deinit {
        cancellableRequest?.cancel()
    }
    
    //MARK: Private Methods
    private func initialSetup() {
        setupTableView()
        fetchDanceoffs()
    }
    
    private func setupTableView() {
        setDataSource()
        registerReusableCell()
    }
    
    private func setDataSource() {
        dataSource = DanceoffsDataSource(tableView: tableView)
        tableView.dataSource = dataSource
    }
    
    private func registerReusableCell() {
        let nib = UINib(nibName: "DanceoffTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: DanceoffTableViewCell.reuseID)
    }
    
    private func fetchDanceoffs() {
        cancellableRequest = Api.danceOffsPopulated
                            .assign(to: \.danceoffs, on: dataSource)
    }
}

extension DanceoffsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 132
    }
}
