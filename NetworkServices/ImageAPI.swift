//
//  ImageAPI.swift
//  FourSquareReplica
//
//  Created by Stephanie Ramirez on 2/18/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//

import Foundation

import Foundation

final class ImageAPIClient {
    static func getImages(venueID: String, completionHandler: @escaping ((AppError?, String?) -> Void)) {
        let URL = "https://api.foursquare.com/v2/venues/\(venueID)/photos?client_id=\(SecretKeys.clientID)&client_secret=\(SecretKeys.clientSecret)&v=220180323"
        NetworkHelper.shared.performDataTask(endpointURLString: URL) { (appError, data) in
            if let error = appError {
                completionHandler(error, nil)
            }
            if let data = data {
                do {
                    let imageLinkData = try JSONDecoder().decode(ImageModel.self, from: data)
                    if let safeImage = imageLinkData.response.photos.items.first {
                        let imageLink = safeImage.prefix + "300x500" + safeImage.suffix
                        completionHandler(nil, imageLink)
                    }
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}
