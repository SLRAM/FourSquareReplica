//
//  FourSquareModel.swift
//  FourSquareReplica
//
//  Created by Ibraheem rawlinson on 2/12/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//

import Foundation
import MapKit
//When you guys get the chance check you indiviual postman to see if you think things should be added to the model or renamed etc.
struct FourSquareModel: Codable {
    let response: ResponseCollection
}

struct ResponseCollection: Codable {
    let venues: [Venues]
}
struct Venues: Codable {
    let name: String // name of the venue
    let location: LocationContainer
    let categories: [Categories]
}
struct LocationContainer: Codable {
    let address: String
    let lat: Double
    let lng: Double
    let distance: Int
    let postalCode: Int
    let city: String
    let state: String
    let country: String
    public var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(lat, lng)
    }
    
}
struct Categories: Codable {
    let id: String // id for the type of category
    let name: String // name of the category
    let icon: IconContainer //Containts an icon image
}

struct IconContainer: Codable {
    let prefix: String //path ex: https ://ss3.4sqi.net/img/categories_v2/nightlife/cocktails_
    let suffix: String // .png - type of file format
}
