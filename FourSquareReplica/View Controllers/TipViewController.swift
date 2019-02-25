//
//  TipViewController.swift
//  FourSquareReplica
//
//  Created by Pursuit on 2/22/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {

    var tipDetail: Venues!
    
    private var itemTitlePlaceHolder = "What did you like about this place? any suggestions or recommendation"
    //private var itemDescriptionPlaceHolder = "Item Description"
    
    lazy var itemTitleTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .white
        textView.font = UIFont(name: "Avenir Next", size: 20)
        textView.textColor = .gray
       return textView
    }()
    
//    lazy var itemDescriptionTextView: UITextView = {
//        let textView = UITextView()
//        textView.backgroundColor = .blue
//        return textView
//    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Save Tip", style: .plain , target: self, action: #selector(SaveTipMechanism))
        view.backgroundColor = .white
        textViewDetails()
        constraintsForTextView()
        navigationItem.title = tipDetail.name
    }
    
    func SaveTipMechanismAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            print("Cancel")
            TipViewController().dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func SaveTipMechanism() {
        guard let itemTitle = itemTitleTextView.text else {
                fatalError("Title, Description nil")
        }
        let date = Date()
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withFullDate,
                                          .withFullTime,
                                          .withInternetDateTime,
                                          .withTimeZone,
                                          .withDashSeparatorInDate]
        let timestamp = isoDateFormatter.string(from: date)
        SaveTipMechanismAlert(title: "Tip Saved", message: "Tip was succesfully save thank you for your recommendation")
       // dismiss(animated: true) {
//            self.navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
        //}
        
    }
    
    func textViewDetails(){
        itemTitleTextView.delegate = self
       // itemDescriptionTextView.delegate = self
        itemTitleTextView.text = itemTitlePlaceHolder
    }
    
    func constraintsForTextView(){
        view.addSubview(itemTitleTextView)
       // view.addSubview(itemDescriptionTextView)
        itemTitleTextView.translatesAutoresizingMaskIntoConstraints = false
        itemTitleTextView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
        itemTitleTextView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        itemTitleTextView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 140).isActive = true
        itemTitleTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    }
    }

extension TipViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if itemTitleTextView.text == itemTitlePlaceHolder {
            textView.text = ""
            textView.textColor = .black
        }
    }
}

