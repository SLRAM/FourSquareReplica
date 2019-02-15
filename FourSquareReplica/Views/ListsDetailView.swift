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
        label.text = "folder name"
        label.textColor = .black
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 20)
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var addButton:UIButton = {
        let button = UIButton()
        button.setTitle("   Favorite   ", for: .normal)
        button.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 0.5408302546, green: 0.6452511549, blue: 0.9180483222, alpha: 1)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.gray.cgColor
        return button
    }()
    
    @objc private func addButtonPressed() {
        print("this will segue to a search view")
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
        backgroundColor = #colorLiteral(red: 0.6793696284, green: 0.6994317174, blue: 0.9765403867, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func titleLabelSetup() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 11).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11).isActive = true
    }
    
    private func addButtonSetup() {
        addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
    }
    
    private func favoritesTVSetup() {
        addSubview(favoritesTV)
        favoritesTV.translatesAutoresizingMaskIntoConstraints = false
        favoritesTV.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        favoritesTV.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        favoritesTV.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        favoritesTV.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 8).isActive = true
    }
}

