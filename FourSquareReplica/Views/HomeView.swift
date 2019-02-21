//
//  HomeView.swift
//  FourSquareReplica
//
//  Created by Stephanie Ramirez on 2/20/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//

import UIKit
import MapKit

protocol HomeViewDelegate: AnyObject {
    func userLocationButton()
}

class HomeView: UIView {
    
    weak var delegate: HomeViewDelegate?
    
    
    lazy var mySearchBarView: UIView = {
        let myv = UIView()
        myv.backgroundColor = .white
        return myv
    }()
    lazy var queryTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Search FourSquares"
//        tf.placeholder = "What are you looking for?"
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
        button.backgroundColor = #colorLiteral(red: 0.6193930507, green: 0.7189580798, blue: 0.9812330604, alpha: 1)
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
    
    lazy var myTableView: UITableView = {
        let tv = UITableView()
        tv.register(HomeListTableViewCell.self, forCellReuseIdentifier: "HomeListTableViewCell")
        tv.rowHeight = (UIScreen.main.bounds.width)/2
        return tv
    }()
    
    lazy var mapView: MKMapView = {
        let view = MKMapView()
        view.mapType = MKMapType.standard
        view.isZoomEnabled = true
        view.isScrollEnabled = true
        view.center = self.center
        return view
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
        setupViews()
        backgroundColor = .white
    }
    
}
extension HomeView {
    func setupViews() {
        setupSearchBarView()
        setupHomeListView()
        setupHomeMapView()
    }
    func setupSearchBarView() {
        addSubview(mySearchBarView)
        mySearchBarView.translatesAutoresizingMaskIntoConstraints = false
        mySearchBarView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        mySearchBarView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mySearchBarView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        mySearchBarView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.05).isActive = true
        setupQueryTextField()
        setupLocationTextField()
        setupNearMeButton()
    }
    func setupQueryTextField() {
        mySearchBarView.addSubview(queryTextField)
        queryTextField.translatesAutoresizingMaskIntoConstraints = false
        queryTextField.topAnchor.constraint(equalTo: mySearchBarView.topAnchor).isActive = true
        queryTextField.bottomAnchor.constraint(equalTo: mySearchBarView.bottomAnchor).isActive = true
        queryTextField.leadingAnchor.constraint(equalTo: mySearchBarView.leadingAnchor).isActive = true
        //        queryTextField.trailingAnchor.constraint(equalTo: nearMeButton.leadingAnchor).isActive = true
        queryTextField.widthAnchor.constraint(equalTo: mySearchBarView.widthAnchor, multiplier: 0.45).isActive = true
    }
    func setupLocationTextField() {
        mySearchBarView.addSubview(locationTextField)
        locationTextField.translatesAutoresizingMaskIntoConstraints = false
        locationTextField.topAnchor.constraint(equalTo: mySearchBarView.topAnchor).isActive = true
        locationTextField.bottomAnchor.constraint(equalTo: mySearchBarView.bottomAnchor).isActive = true
        locationTextField.trailingAnchor.constraint(equalTo: mySearchBarView.trailingAnchor).isActive = true
        //        queryTextField.trailingAnchor.constraint(equalTo: nearMeButton.leadingAnchor).isActive = true
        locationTextField.widthAnchor.constraint(equalTo: mySearchBarView.widthAnchor, multiplier: 0.45).isActive = true
    }
    func setupNearMeButton() {
        mySearchBarView.addSubview(nearMeButton)
        nearMeButton.translatesAutoresizingMaskIntoConstraints = false
        nearMeButton.centerXAnchor.constraint(equalTo: mySearchBarView.centerXAnchor).isActive = true
        nearMeButton.centerYAnchor.constraint(equalTo: mySearchBarView.centerYAnchor).isActive = true
        
    }
    
    func setupHomeListView() {
        addSubview(myTableView)
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        //        myTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        myTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        myTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        myTableView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.95).isActive = true
    }
    func setupHomeMapView() {
        addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
//        mapView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        mapView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        mapView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        mapView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        mapView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.95).isActive = true
    }
    
    
    
    
}
