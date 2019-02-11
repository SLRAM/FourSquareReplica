//
//  ListsDetailTableViewCell.swift
//  FourSquareReplica
//
//  Created by Stephanie Ramirez on 2/8/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//  Alyson

import UIKit

class ListsDetailTableViewCell: UITableViewCell {
    
    lazy var favoritesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "name of place here"
        label.textAlignment = .left
        label.backgroundColor = .gray
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        favoritesLabelSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func favoritesLabelSetup() {
        addSubview(favoritesLabel)
        favoritesLabel.translatesAutoresizingMaskIntoConstraints = false
        favoritesLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        favoritesLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 11).isActive = true
        favoritesLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -11).isActive = true
    }
}
