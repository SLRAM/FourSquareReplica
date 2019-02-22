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
        folderCreation.cancelButton.addTarget(self, action: #selector(returnActionStuff), for: .touchUpInside)
        print(DataPersistenceManager.documentsDirectory())
//        folderCreation.cancelButton.transform =  CGAffineTransform(rotationAngle: 40.05)
//        folderCreation.cancelButton.alpha = 0.0
        perform(#selector(somethingelse), with: AnyClass.self, afterDelay: 0.6)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        moveCancelButtonAnimation()
    }
    
    func moveCancelButtonAnimation() {
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseInOut], animations: {
            self.folderCreation.cancelButton.transform = CGAffineTransform(rotationAngle: 40.0555)
            self.folderCreation.cancelButton.transform = CGAffineTransform(translationX: 135, y: -450)
        })
    }
    
    @objc func somethingelse(){
    folderCreation.cancelButton.alpha = 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        registerKeyboardNotifications()
    }
   private func registerKeyboardNotifications() {
    NotificationCenter.default.addObserver(self, selector: #selector(ShowKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(HideKeyBoard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
   @objc func ShowKeyboard(notification:Notification) {
    guard let info = notification.userInfo,
        let _ = info["UIKeyboardFrameEndUserInfoKey"] as? CGRect else {
            print("userInfo is nil")
            return
    }
    
    
    folderCreation.alertView.transform = CGAffineTransform(translationX: 0, y: -130)
    folderCreation.TextFields.transform = CGAffineTransform(translationX: 0, y: -130)
    folderCreation.TextFields1.transform = CGAffineTransform(translationX: 0, y: -130)
    folderCreation.buttonforAlyson.transform = CGAffineTransform(translationX: 0, y: -130)
    }
    
    @objc private func HideKeyBoard(notification:Notification){
        folderCreation.alertView.transform = CGAffineTransform.identity
        folderCreation.buttonforAlyson.transform = CGAffineTransform.identity
        folderCreation.TextFields.transform = CGAffineTransform.identity
        folderCreation.TextFields1.transform = CGAffineTransform.identity
    }

    @objc func returnActionStuff() {
//        self.listsView.createbutton.alpha = 1
        dismiss(animated: true , completion: nil)
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
            dismiss(animated: true, completion: nil)
            }
    }
    
    func createAlertForFolderIfEmpty(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            print("Cancel")
        }))        
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension FolderCreationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
