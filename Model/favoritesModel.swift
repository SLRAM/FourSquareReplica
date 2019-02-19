//
//  favoritesModel.swift
//  FourSquareReplica
//
//  Created by Alyson Abril on 2/19/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//

import Foundation

final class DataPersistenceManager {
    static func documentsDirectory() -> URL {
        return
            FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    static func filepathToDocumentDirectory(filename: String) -> URL {
        return documentsDirectory().appendingPathComponent(filename)
    }
}

final class FavoritesModel {
    private static let favoriteName = "FavoritesCell.plist"
    private static var items = [FavoritesSetUp]()
    
    static func getItems() -> [FavoritesSetUp] {
        let path = DataPersistenceManager.filepathToDocumentDirectory(filename: favoriteName).path
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    items = try PropertyListDecoder().decode([FavoritesSetUp].self, from: data)
                } catch {
                    print("Property list decoding error: \(error)")
                }
            } else {
                print("data is nil")
            }
        } else {
            print("\(favoriteName) doesn't exist")
        }
        items = items.sorted{ $0.placeName > $1.placeName }
        return items
    }
    static func addItem(item: FavoritesSetUp) {
        //Append to array of items
        items.append(item)
        save()
    }
    
    static func delete(index: Int) {
        items.remove(at: index)
        save()
    }
    static func save() {
        // path
        let path = DataPersistenceManager.filepathToDocumentDirectory(filename: favoriteName)
        do {
            let data = try PropertyListEncoder().encode(items)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("Property list encoding error: \(error)")
        }
    }
    
}
