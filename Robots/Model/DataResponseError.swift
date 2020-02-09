//
//  DataResponseError.swift
//  Robots
//
//  Created by Karen Karapetyan on 2/4/20.
//  Copyright © 2020 Karen Karapetyan. All rights reserved.
//

import Foundation

enum DataResponseError: Error {
    case network
    case decoding
}

extension DataResponseError {
    
    var description: String {
        switch self {
        case .network:
            return "Request failed"
        case .decoding:
            return "Failed to decode"
        }
    }
}
