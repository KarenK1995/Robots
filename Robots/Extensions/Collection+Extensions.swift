//
//  Collection+Extensions.swift
//  Robots
//
//  Created by Karen Karapetyan on 2/8/20.
//  Copyright © 2020 Karen Karapetyan. All rights reserved.
//

import Foundation

extension Collection {
    
    func random(n: Int) -> [Self.Element] {
        return Array(shuffled().prefix(n))
    }
}
