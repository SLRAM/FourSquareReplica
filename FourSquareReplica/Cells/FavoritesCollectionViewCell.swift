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
        label.textAlignment = .center
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = #colorLiteral(red: 0.5557976961, green: 0.7569350004, blue: 0.892960012, alpha: 0.9393728596)
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
