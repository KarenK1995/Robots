//
//  ApiError.swift
//  Robots
//
//  Created by Karen Karapetyan on 2/4/20.
//  Copyright © 2020 Karen Karapetyan. All rights reserved.
//

import Foundation

struct ApiError: Codable {
    let statusCode: Int
    let error, message: String
}
