//
//  SearchBarView.swift
//  FourSquareReplica
//
//  Created by Stephanie Ramirez on 2/19/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//

import UIKit
protocol SearchBarViewDelegate: AnyObject {
    func userLocationButton()
}

class SearchBarView: UIView {
    
    weak var delegate: SearchBarViewDelegate?
    
    
    lazy var myView: UIView = {
        let myv = UIView()
        myv.backgroundColor = .white
        return myv
    }()
    lazy var queryTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "ex. pancakes"
        tf.textColor = .black
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 2
        tf.layer.borderColor = UIColor.gray.cgColor
        tf.textAlignment = .center
        return tf
    }()
    
    lazy var nearMeButton:UIButton = {
        let button = UIButton()
        button.setTitle("me", for: .normal)
        button.addTarget(self, action: #selector(nearMeButtonPressed), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 0.5408302546, green: 0.6452511549, blue: 0.9180483222, alpha: 1)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.gray.cgColor
        return button
    }()
    @objc func nearMeButtonPressed() {
        print("near me pressed")
        delegate?.userLocationButton()
        
    }
    lazy var locationTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "ex. Miami"
        tf.textColor = .black
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 2
        tf.layer.borderColor = UIColor.gray.cgColor
        tf.textAlignment = .center

        return tf
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        setupView()
    }
    
}
extension SearchBarView {
    func setupView() {
        addSubview(myView)
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        myView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        myView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        myView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.05).isActive = true
        setupSubViews()
    }
    func setupSubViews() {
        setupQueryTextField()
        setupLocationTextField()
        setupNearMeButton()
    }
    func setupQueryTextField() {
        myView.addSubview(queryTextField)
        queryTextField.translatesAutoresizingMaskIntoConstraints = false
        queryTextField.topAnchor.constraint(equalTo: myView.topAnchor).isActive = true
        queryTextField.bottomAnchor.constraint(equalTo: myView.bottomAnchor).isActive = true
        queryTextField.leadingAnchor.constraint(equalTo: myView.leadingAnchor).isActive = true
//        queryTextField.trailingAnchor.constraint(equalTo: nearMeButton.leadingAnchor).isActive = true
        queryTextField.widthAnchor.constraint(equalTo: myView.widthAnchor, multiplier: 0.45).isActive = true
    }
    func setupLocationTextField() {
        myView.addSubview(locationTextField)
        locationTextField.translatesAutoresizingMaskIntoConstraints = false
        locationTextField.topAnchor.constraint(equalTo: myView.topAnchor).isActive = true
        locationTextField.bottomAnchor.constraint(equalTo: myView.bottomAnchor).isActive = true
        locationTextField.trailingAnchor.constraint(equalTo: myView.trailingAnchor).isActive = true
        //        queryTextField.trailingAnchor.constraint(equalTo: nearMeButton.leadingAnchor).isActive = true
        locationTextField.widthAnchor.constraint(equalTo: myView.widthAnchor, multiplier: 0.45).isActive = true
    }
    func setupNearMeButton() {
        myView.addSubview(nearMeButton)
        nearMeButton.translatesAutoresizingMaskIntoConstraints = false
        nearMeButton.centerXAnchor.constraint(equalTo: myView.centerXAnchor).isActive = true
        nearMeButton.centerYAnchor.constraint(equalTo: myView.centerYAnchor).isActive = true
        
    }
}
