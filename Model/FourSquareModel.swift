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
    let response: ResponseCollection?
}

struct ResponseCollection: Codable {
    let venues: [Venues]
}
struct Venues: Codable {
    let id: String
    let name: String // name of the venue
    let location: LocationContainer
    let categories: [Categories]
}
struct LocationContainer: Codable {
<<<<<<< HEAD
    let address: String?
=======
    let address: String
>>>>>>> qa
    let lat: Double?
    let lng: Double?
    let distance: Int
//    let postalCode: String?
    let city: String
    let state: String
    let country: String
    public var coordinate: CLLocationCoordinate2D {
<<<<<<< HEAD
        return CLLocationCoordinate2DMake(lat!, lng!)
=======
        guard let lat = lat, let lng = lng else {
            fatalError("lat and long are nil")
        }
        return CLLocationCoordinate2DMake(lat, lng)
>>>>>>> qa
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
