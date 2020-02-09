//
//  AppSettings.swift
//  Robots
//
//  Created by Karen Karapetyan on 2/9/20.
//  Copyright © 2020 Karen Karapetyan. All rights reserved.
//

import Foundation

struct AppSettings {
    
    private static let defaults = UserDefaults.standard
    
    struct Danceoff {
        
        private static let key = "DanceoffFinished"
        
        static func setFinished(_ finished: Bool) {
            defaults.set(finished, forKey: key)
        }
        
        static func isFinished() -> Bool {
            return defaults.bool(forKey: key)
        }
    }
}


