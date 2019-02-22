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
        label.text = "words"
        label.textColor = .black
        label.font = UIFont(name: "AvenirNext-Bold", size: 25)
        label.textAlignment = .center
        label.backgroundColor = #colorLiteral(red: 1, green: 0.3412312865, blue: 0.3433039784, alpha: 1)
        return label
    }()
    

    lazy var favoritesTV: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = #colorLiteral(red: 0.2660466433, green: 0.2644712925, blue: 0.2672616839, alpha: 1)
        return tv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.favoritesTV.register(ListsDetailTableViewCell.self, forCellReuseIdentifier: "ListTVCell")
        titleLabelSetup()
        favoritesTVSetup()
        backgroundColor = #colorLiteral(red: 0.2660466433, green: 0.2644712925, blue: 0.2672616839, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func titleLabelSetup() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 39).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11).isActive = true
    }
    
    private func favoritesTVSetup() {
        addSubview(favoritesTV)
        favoritesTV.translatesAutoresizingMaskIntoConstraints = false
        favoritesTV.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        favoritesTV.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        favoritesTV.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        favoritesTV.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50).isActive = true
    }
}

