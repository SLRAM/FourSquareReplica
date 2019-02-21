//
//  FavoritesSearchVC.swift
//  FourSquareReplica
//
//  Created by Alyson Abril on 2/19/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//

import UIKit

class FavoritesSearchVC: UIViewController {

    var favoritesSearch = FavoritesSearchView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(favoritesSearch)
        favoritesSearch.addToListsCV.delegate = self
        favoritesSearch.addToListsCV.dataSource = self
    }
    
}

extension FavoritesSearchVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = favoritesSearch.addToListsCV.dequeueReusableCell(withReuseIdentifier: "FavoriteCell", for: indexPath) as? FavoritesCollectionViewCell else { return UICollectionViewCell() }
        //let folderInfo = FolderModel.getItems()[indexPath.row]
        //cell.folderTitle.text = folderInfo.title
        return cell
    }
    
    
}
