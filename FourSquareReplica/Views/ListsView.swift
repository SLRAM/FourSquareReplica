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
        layout.itemSize = CGSize.init(width: 110, height: 110)
        layout.sectionInset = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
        let Collection = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        Collection.backgroundColor = .clear
        //layout.scrollDirection = .horizontal
        return Collection
    }()
    
    lazy var createbutton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "addButton"), for: .normal)
        button.contentMode = .scaleAspectFill
        //button.backgroundColor = .red
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
        createbutton.translatesAutoresizingMaskIntoConstraints = false
//        createbutton.topAnchor.constraint(equalTo: topAnchor, constant: 190).isActive = true
            createbutton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        createbutton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 300).isActive = true
        createbutton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true
        createbutton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.22).isActive = true
//        createbutton.bottomAnchor.constraint(equalToSystemSpacingBelow: folderCollectionView.topAnchor, multiplier: 0.5).isActive = true
        
        addSubview(folderCollectionView)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
        folderCollectionView.translatesAutoresizingMaskIntoConstraints = false
        folderCollectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
        folderCollectionView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        //folderCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        folderCollectionView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        folderCollectionView.centerYAnchor.constraint(equalToSystemSpacingBelow: centerYAnchor, multiplier: 0.2).isActive = true
    }
}
extension ListsView {
    private func setupView() {
        constraints()
}
}
