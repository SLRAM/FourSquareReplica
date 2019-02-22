//
//  FolderCreationViewController.swift
//  FourSquareReplica
//
//  Created by Pursuit on 2/15/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//

import UIKit

class FolderCreationViewController: UIViewController {
    
    let folderCreation = FoldercreationView()
    let listsView = ListsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(folderCreation)
        folderCreation.TextFields.delegate = self
        folderCreation.TextFields1.delegate = self
        folderCreation.buttonforAlyson.addTarget(self, action: #selector(segueForAlyson), for: .touchUpInside)
        print(DataPersistenceManager.documentsDirectory())
    }
    
    @objc func segueForAlyson() {
        let date = Date()
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withFullDate,
                                          .withFullTime,
                                          .withInternetDateTime,
                                          .withTimeZone,
                                          .withDashSeparatorInDate]
        let timestamp = isoDateFormatter.string(from: date)
       // let move = ListsDetailViewController()
        if self.folderCreation.TextFields.text == "" || self.folderCreation.TextFields.text == " " {
                self.createAlertForFolderIfEmpty(title:"Please enter a title", message: "Can't create a folder without a title")
        } else {
        let folderDetails = folderSetUp.init(title: self.folderCreation.TextFields.text!, description: self.folderCreation.TextFields1.text!, createdAt: timestamp)
            FolderModel.addItem(item: folderDetails)
            listsView.folderCollectionView.reloadData()
            dismiss(animated: true , completion: nil)
            }
    }
    
    func createAlertForFolderIfEmpty(title: String, message: String)  {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            print("Cancel")
        }))        
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension FolderCreationViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == "" || textField.text == " " {
        }
    }
    
}
