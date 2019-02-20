//
//  ListsView.swift
//  FourSquareReplica
//
//  Created by Stephanie Ramirez on 2/8/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//

import UIKit

class ListsView: UIView {
//var counter = 0
    lazy var folderCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 80, height: 80)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        let Collection = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        Collection.backgroundColor = .white
        //layout.scrollDirection = .horizontal
        return Collection
    }()
    
    lazy var createbutton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    
    lazy var cancelButton: UIButton = {
    let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame:UIScreen.main.bounds)
        self.backgroundColor = .white
        constraints()
        folderCollectionView.register(ListsCollectionViewCell.self, forCellWithReuseIdentifier: "ListCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func constraints() {
        addSubview(createbutton)
        addSubview(cancelButton)
        createbutton.translatesAutoresizingMaskIntoConstraints = false
        createbutton.topAnchor.constraint(equalTo: topAnchor, constant: 190).isActive = true
        createbutton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        createbutton.centerYAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: centerYAnchor, multiplier: 1).isActive = true
//        createbutton.bottomAnchor.constraint(equalToSystemSpacingBelow: folderCollectionView.topAnchor, multiplier: 0.5).isActive = true
        
        addSubview(folderCollectionView)
        folderCollectionView.translatesAutoresizingMaskIntoConstraints = false
        folderCollectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
        folderCollectionView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        //folderCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        folderCollectionView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        folderCollectionView.centerYAnchor.constraint(equalToSystemSpacingBelow: centerYAnchor, multiplier: 0.4).isActive = true
    }
}
