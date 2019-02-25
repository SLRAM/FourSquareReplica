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
    var listViewController = ListsViewController()
    var saveInfoToPlist: Venues!
    var folderInfo = [folderSetUp]()
    var venueInfo: FavoritesSetUp!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(favoritesSearch)
        favoritesSearch.addToListsCV.delegate = self
        favoritesSearch.addToListsCV.dataSource = self
        favoritesSearch.createbutton.addTarget(self, action: #selector(addToNewFolder), for: .touchUpInside)
        //view.backgroundColor =
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        favoritesSearch.addToListsCV.reloadData()
    }
    
    public convenience init(folder:[folderSetUp],venue: FavoritesSetUp) {
        self.init()
        self.folderInfo = folder
        self.venueInfo = venue
        self.view.backgroundColor = .clear
    }
    @objc func addToNewFolder() {
        let vc = FolderCreationViewController()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .popover
        self.present(vc, animated: true, completion: nil) 
    }
    
}

extension FavoritesSearchVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FolderModel.getItems().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = favoritesSearch.addToListsCV.dequeueReusableCell(withReuseIdentifier: "FavoriteCell", for: indexPath) as? FavoritesCollectionViewCell else { return UICollectionViewCell() }
        let folderInfo = FolderModel.getItems()[indexPath.row]
        cell.favoritePlace.text = folderInfo.title
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        var info = folderInfo[indexPath.row]
//        FolderModel.addItem(type: &info, saveOtherInfo: venueInfo, at: indexPath.row)
        guard let name = self.saveInfoToPlist?.name,
            let address = self.saveInfoToPlist?.location.address,
            let secondPartaddress = self.saveInfoToPlist.location.city
            else {return}
    navigationController?.pushViewController(ListsDetailViewController(), animated: true)
        let storeStuff = FavoritesSetUp.init(placeName: name
            , address: "\(address), \(secondPartaddress)")
        FavoritesModel.addItem(item: storeStuff)
    }
    
}
