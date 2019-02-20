//
//  FourSquareAPI.swift
//  FourSquareReplica
//
//  Created by Stephanie Ramirez on 2/14/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//

import Foundation
import MapKit

final class FourSquareAPI {
    
    private init() {}
    static func searchFourSquare(userLocation: CLLocationCoordinate2D, near: String, query: String, completionHandler: @escaping (AppError?, [Venues]?) -> Void) {
        //ll= if user allows us to use thier location info or near= if they deny/search by place
        var userLocationAdded = ""
        if !userLocation.latitude.description.isEmpty || !userLocation.longitude.description.isEmpty {
            userLocationAdded = "ll=\(userLocation.latitude),\(userLocation.longitude)"
        }
        let endpointURLString = "https://api.foursquare.com/v2/venues/search?client_id=\(SecretKeys.clientID)&client_secret=\(SecretKeys.clientSecret)&v=20180323&limit=10&\(userLocationAdded)&near=\(near)&query=\(query)"
        
        NetworkHelper.shared.performDataTask(endpointURLString: endpointURLString) { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
            if let data = data {
                do {
                    let fourSquareInfo = try JSONDecoder().decode(FourSquareModel.self, from: data)
                    completionHandler(nil, fourSquareInfo.response!.venues)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                    print("1")
                }
            }
        }
    }
}
