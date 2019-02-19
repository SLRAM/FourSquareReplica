//
//  FoldercreationView.swift
//  FourSquareReplica
//
//  Created by Pursuit on 2/15/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//

import UIKit

class FoldercreationView: UIView {
    
    lazy var buttonforAlyson: UIButton = {
        let button = UIButton()
        button.setTitle("HI Alyson", for: .normal)
        button.backgroundColor = .blue
      return button
    }()
    
    lazy var alertView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    lazy var TextFields: UITextField = {
        let textField = UITextField()
        textField.placeholder = "FolderName"
        textField.backgroundColor = .red
        return textField
    }()
    lazy var TextFields1: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Description"
        textField.backgroundColor = .red
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.backgroundColor = #colorLiteral(red: 0.1342799664, green: 0.1250010133, blue: 0.853731811, alpha: 0.1402280468)
        self.isOpaque = true
        self.clearsContextBeforeDrawing = true
        SetUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func SetUp(){
        addSubview(alertView)
        addSubview(TextFields)
        addSubview(TextFields1)
        addSubview(buttonforAlyson)
        alertView.translatesAutoresizingMaskIntoConstraints = false
        alertView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75).isActive = true
        alertView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        alertView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        alertView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        TextFields.translatesAutoresizingMaskIntoConstraints = false
        TextFields.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 11).isActive = true
        TextFields.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -11).isActive = true
        TextFields1.centerYAnchor.constraint(equalToSystemSpacingBelow: centerYAnchor, multiplier: 1).isActive = true
        TextFields1.translatesAutoresizingMaskIntoConstraints = false
        TextFields1.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 11).isActive = true
        TextFields1.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -11).isActive = true
        TextFields1.topAnchor.constraint(equalTo: TextFields.bottomAnchor, constant: 11).isActive = true
        
        buttonforAlyson.translatesAutoresizingMaskIntoConstraints = false
        //buttonforAlyson.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true
        //buttonforAlyson.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1).isActive = true
        
        buttonforAlyson.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        buttonforAlyson.centerYAnchor.constraint(equalTo: TextFields1.bottomAnchor, constant: 40) .isActive = true
    }
    
}
