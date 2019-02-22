//
//  FolderSetUpModel.swift
//  FourSquareReplica
//
//  Created by Pursuit on 2/15/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//


import Foundation

final class FolderModel {
    private static let fileName = "FolderCell.plist"
    private static var items = [folderSetUp]()
    private static var item = [things]()
    
    static func getItems() -> [folderSetUp] {
        let path = DataPersistenceManager.filepathToDocumentDirectory(filename: fileName).path
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    items = try PropertyListDecoder().decode([folderSetUp].self, from: data)
                } catch {
                    print("Property list decoding error: \(error)")
                }
            } else {
                print("data is nil")
            }
        } else {
            print("\(fileName) doesn't exist")
        }
        items = items.sorted{$0.date > $1.date}
        return items
    }
    static func addItem(item: folderSetUp) {
        //Append to array of items
        items.append(item)
        save()
    }
    static func addthings(itemy: things){
        item.append(itemy)
        save()
    }
    
    static func delete(index: Int) {
        items.remove(at: index)
        save()
    }
    static func save() {
        // path
        let path = DataPersistenceManager.filepathToDocumentDirectory(filename: fileName)
        do {
            let data = try PropertyListEncoder().encode(items)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("Property list encoding error: \(error)")
        }
    }
    
}
