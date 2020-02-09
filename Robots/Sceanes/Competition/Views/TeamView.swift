//
//  TeamView.swift
//  Robots
//
//  Created by Karen Karapetyan on 2/8/20.
//  Copyright © 2020 Karen Karapetyan. All rights reserved.
//

import UIKit

class TeamView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var robots: Robots = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialSetup()
    }
    
    //MARK: Methods
    private func initialSetup() {
        addContentView()
        registerReusableCell()
    }
     
    private func addContentView() {
        let bundle = Bundle(for: type(of: self))
        bundle.loadNibNamed("TeamView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
    }
    
    private func registerReusableCell() {
        let nib = UINib(nibName: "RobotCollectionViewCell", bundle: nil)
        let reuseID = RobotCollectionViewCell.reuseID
        collectionView.register(nib, forCellWithReuseIdentifier: reuseID)
        collectionView.dataSource = self
    }
}

extension TeamView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return robots.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseID = RobotCollectionViewCell.reuseID
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseID, for: indexPath) as! RobotCollectionViewCell
        cell.robot = robots[indexPath.row]
        return cell
    }
}
