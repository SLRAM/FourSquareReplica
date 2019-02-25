//
//  FoldercreationView.swift
//  FourSquareReplica
//
//  Created by Pursuit on 2/15/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//

import UIKit

class FoldercreationView: UIView {
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cancelButton"), for: .normal)
        return button
    }()
    lazy var buttonforAlyson: UIButton = {
        let button = UIButton()
        button.setTitle("Create Folder", for: .normal)
        button.backgroundColor = .blue
     // button.titleLabel?.textColor = .black
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
        textField.backgroundColor = .white
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        return textField
    }()
    lazy var TextFields1: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Description"
        textField.backgroundColor = .white
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.backgroundColor = #colorLiteral(red: 0, green: 0.4128293395, blue: 1, alpha: 0.2389485917)
        //self.backgroundColor = .blue
        //self.isOpaque = true
        // self.clearsContextBeforeDrawing = true
        SetUp()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func SetUp(){
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.magenta.cgColor,UIColor.red.cgColor,UIColor.purple.cgColor,UIColor.blue.cgColor]
        self.layer.addSublayer(gradient)
        addSubview(alertView)
        addSubview(TextFields)
        addSubview(TextFields1)
        addSubview(buttonforAlyson)
        addSubview(cancelButton)
        alertView.translatesAutoresizingMaskIntoConstraints = false
        alertView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
        alertView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        alertView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        alertView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        TextFields.translatesAutoresizingMaskIntoConstraints = false
        TextFields.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100).isActive = true
        TextFields.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 11).isActive = true
        TextFields.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -11).isActive = true
        
        TextFields1.translatesAutoresizingMaskIntoConstraints = false
        TextFields1.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 11).isActive = true
        TextFields1.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -11).isActive = true
       TextFields1.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -40).isActive = true
        //TextFields1.topAnchor.constraint(equalTo: TextFields.bottomAnchor).isActive = true

        
        buttonforAlyson.translatesAutoresizingMaskIntoConstraints = false
        //buttonforAlyson.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true
        //buttonforAlyson.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1).isActive = true
        buttonforAlyson.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        buttonforAlyson.centerYAnchor.constraint(equalTo: TextFields1.bottomAnchor, constant: 180) .isActive = true
        buttonforAlyson.bottomAnchor.constraint(equalTo: alertView.bottomAnchor, constant: 0).isActive = true
        
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        cancelButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 300).isActive = true
        cancelButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true
        cancelButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.22).isActive = true
    }
    
}
