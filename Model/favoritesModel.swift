//
//  favoritesModel.swift
//  FourSquareReplica
//
//  Created by Alyson Abril on 2/19/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//

import Foundation

final class FavoritesModel {
    private static let favoriteName = "FavoritesCell.plist"
    private static var itemy = [FavoritesSetUp]()
    
    static func getItems() -> [FavoritesSetUp] {
        let path = DataPersistenceManager.filepathToDocumentDirectory(filename: favoriteName).path
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    itemy = try PropertyListDecoder().decode([FavoritesSetUp].self, from: data)
                } catch {
                    print("Property list decoding error: \(error)")
                }
            } else {
                print("data is nil")
            }
        } else {
            print("\(favoriteName) doesn't exist")
        }
        itemy = itemy.sorted{ $0.placeName > $1.placeName }
        return itemy
    }
    static func addItem(item: FavoritesSetUp) {
        //Append to array of items
        itemy.append(item)
        save()
    }
    
    static func delete(index: Int) {
        itemy.remove(at: index)
        save()
    }
    static func save() {
        // path
        let path = DataPersistenceManager.filepathToDocumentDirectory(filename: favoriteName)
        do {
            let data = try PropertyListEncoder().encode(itemy)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("Property list encoding error: \(error)")
        }
    }
    
}
