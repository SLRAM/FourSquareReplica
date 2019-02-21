//
//  FavoritesCollectionViewCell.swift
//  FourSquareReplica
//
//  Created by Alyson Abril on 2/21/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//

import UIKit

class FavoritesCollectionViewCell: UICollectionViewCell {
    lazy var favoritePlace: UILabel = {
        let label = UILabel()
        label.text = "Do i work"
        label.textAlignment = .center
        //    label.backgroundColor = .purple
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .gray
        favoritePlaceSetUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func favoritePlaceSetUp() {
        addSubview(favoritePlace)
        favoritePlace.translatesAutoresizingMaskIntoConstraints = false
        favoritePlace.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        favoritePlace.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        favoritePlace.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -88).isActive = true
    }
    
}
