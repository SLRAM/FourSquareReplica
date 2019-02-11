//
//  ListsDetailView.swift
//  FourSquareReplica
//
//  Created by Stephanie Ramirez on 2/8/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//  Alyson

import UIKit

class ListsDetailView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "title will go here"
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .magenta
        return label
    }()
    
    lazy var addButton:UIButton = {
        let button = UIButton()
        button.setTitle("Add to Favorites", for: .normal)
        button.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        button.backgroundColor = .red
        return button
    }()
    
    @objc private func addButtonPressed() {
        print("i am doing a thing")
    }
    
    lazy var favoritesTV: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .green
        return tv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.favoritesTV.register(ListsDetailTableViewCell.self, forCellReuseIdentifier: "ListTVCell")
        titleLabelSetup()
        addButtonSetup()
        favoritesTVSetup()
        backgroundColor = .blue
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func titleLabelSetup() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 11).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    }
    
    private func addButtonSetup() {
        addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25).isActive = true
        addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
    }
    
    private func favoritesTVSetup() {
        addSubview(favoritesTV)
        favoritesTV.translatesAutoresizingMaskIntoConstraints = false
//        favoritesTV.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 15).isActive = true
//        favoritesTV.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
//        favoritesTV.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        favoritesTV.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        favoritesTV.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        favoritesTV.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        favoritesTV.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}

