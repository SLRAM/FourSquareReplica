//
//  ListsDetailTableViewCell.swift
//  FourSquareReplica
//
//  Created by Stephanie Ramirez on 2/8/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//  Alyson

import UIKit

class ListsDetailTableViewCell: UITableViewCell {
    
    lazy var favoritesNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "name of place"
        label.font = UIFont(name: "AvenirNext-Bold", size: 18)
        label.textAlignment = .left
//        label.backgroundColor = #colorLiteral(red: 1, green: 0.5315278172, blue: 0.8206806779, alpha: 1)
        return label
    }()
    
    lazy var favoritesAddressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
//        label.backgroundColor = #colorLiteral(red: 0.4260549545, green: 0.2493847907, blue: 0.7767984271, alpha: 1)
        label.text = "street address\ncity and state"
        label.font = UIFont(name: "Avenir Next", size: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var favoritesImage: UIImageView = {
       let image = UIImageView(image: UIImage(named: "Placeholder"))
        return image
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        favoritesLabelSetup()
        favoritesAddressLabelSetup()
        favoritesImageSetup()
    }

    func favoritesLabelSetup() {
        addSubview(favoritesNameLabel)
        favoritesNameLabel.translatesAutoresizingMaskIntoConstraints = false
        favoritesNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25).isActive = true
        favoritesNameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.65).isActive = true
        favoritesNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    }
    
    func favoritesAddressLabelSetup() {
        addSubview(favoritesAddressLabel)
        favoritesAddressLabel.translatesAutoresizingMaskIntoConstraints = false
        favoritesAddressLabel.topAnchor.constraint(equalTo: favoritesNameLabel.bottomAnchor).isActive = true
        favoritesAddressLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.65).isActive = true
        favoritesAddressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    }
    
    func favoritesImageSetup() {
        addSubview(favoritesImage)
        favoritesImage.translatesAutoresizingMaskIntoConstraints = false
        favoritesImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4).isActive = true
        favoritesImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        favoritesImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.80).isActive = true
        favoritesImage.widthAnchor.constraint(equalTo: favoritesImage.heightAnchor).isActive = true
    }
}


