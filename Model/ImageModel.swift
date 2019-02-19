//
//  ImageModel.swift
//  FourSquareReplica
//
//  Created by Stephanie Ramirez on 2/18/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//

import Foundation

struct ImageModel: Codable {
    let response: Response
}

struct Response: Codable {
    let photos: Photos
}

struct Photos: Codable {
    let items: [Items]
}

struct Items: Codable {
    let prefix: String
    let suffix: String
}
