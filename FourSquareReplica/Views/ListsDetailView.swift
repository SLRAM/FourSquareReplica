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
        return label
    }()
    
    lazy var addButton:UIButton = {
        let button = UIButton()
        button.setTitle("Add to Favorites", for: .normal)
        button.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc private func addButtonPressed() {
        
    }
    
    lazy var favoritesTV: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.delegate = self
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.favoritesTV.register(ListsDetailTableViewCell.self, forCellReuseIdentifier: "ListTVCell")
        titleLabelSetup()
        addButtonSetup()
        favoritesTVSetup()
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func titleLabelSetup() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    }
    
    private func addButtonSetup() {
        addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25).isActive = true
        addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 15).isActive = true 
    }
    
    private func favoritesTVSetup() {
        addSubview(favoritesTV)
        favoritesTV.translatesAutoresizingMaskIntoConstraints = false
        favoritesTV.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 15).isActive = true
        favoritesTV.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        favoritesTV.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    }
}

extension ListsDetailView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = favoritesTV.dequeueReusableCell(withIdentifier: "ListTVCell", for: indexPath) as? ListsDetailTableViewCell else { return UITableViewCell()}
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
