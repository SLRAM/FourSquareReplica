//
//  FourSquareAPI.swift
//  FourSquareReplica
//
//  Created by Stephanie Ramirez on 2/14/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//

import Foundation

final class FourSquareAPI {
    
    private init() {}
    static func searchFourSquare(completionHandler: @escaping (AppError?, [Venues]?) -> Void) {
        
        let endpointURLString = "https://api.foursquare.com/v2/venues/search?client_id=\(SecretKeys.clientID)&client_secret=\(SecretKeys.clientSecret)&v=20180323&limit=10&ll=40.7252,-73.9782&query="
        
        NetworkHelper.shared.performDataTask(endpointURLString: endpointURLString) { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
            if let data = data {
                do {
                    let fourSquareInfo = try JSONDecoder().decode(FourSquareModel.self, from: data)
                    completionHandler(nil, fourSquareInfo.response.venues)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}
