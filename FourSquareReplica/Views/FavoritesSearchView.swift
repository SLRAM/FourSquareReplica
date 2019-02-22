//
//  FavoritesSearchView.swift
//  FourSquareReplica
//
//  Created by Alyson Abril on 2/19/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//

import UIKit

class FavoritesSearchView: UIView {

    //collection view, inside collection view cell is a button for adding to list detail view controller
    lazy var createbutton: UIButton = {
        let button = UIButton()
        button.setTitle("add place to new Folder", for: .normal)
        button.contentMode = .scaleAspectFill
        button.backgroundColor = .green
        return button
    }()
    
    lazy var addToListsCV:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 300, height: 340)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        let Collection = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        Collection.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        return Collection
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .white
        addToListsCV.register(FavoritesCollectionViewCell.self, forCellWithReuseIdentifier: "FavoriteCell")
        addToListsSetUp()
        addResturantToFolder()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func addToListsSetUp() {
    addSubview(addToListsCV)
    addToListsCV.translatesAutoresizingMaskIntoConstraints = false
    addToListsCV.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
    addToListsCV.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
    addToListsCV.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    addToListsCV.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    addToListsCV.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func addResturantToFolder(){
        addSubview(createbutton)
        createbutton.translatesAutoresizingMaskIntoConstraints = false
        createbutton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        createbutton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        createbutton.bottomAnchor.constraint(equalTo: addToListsCV.topAnchor, constant: 0).isActive = true
//        createbutton.centerYAnchor.constraint(equalTo: addToListsCV.centerYAnchor).isActive = true
        
    }
}
