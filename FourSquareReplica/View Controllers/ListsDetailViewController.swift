//
//  ListsDetailViewController.swift
//  FourSquareReplica
//
//  Created by Stephanie Ramirez on 2/8/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//  Alyson

import UIKit

class ListsDetailViewController: UIViewController {
    
    var listDetailView = ListsDetailView()
    var folderController = FolderCreationViewController()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(listDetailView)
        listDetailView.favoritesTV.dataSource = self
        listDetailView.favoritesTV.delegate = self
        listDetailView.titleLabel.text = FolderModel.getItems().first?.title
    }
 
}

extension ListsDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FavoritesModel.getItems().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listDetailView.favoritesTV.dequeueReusableCell(withIdentifier: "ListTVCell", for: indexPath) as? ListsDetailTableViewCell else { return UITableViewCell()}
//        cell.favoritesImage.image = UIImage(named: "Placeholder")
        let cellInfo = FavoritesModel.getItems()[indexPath.row]
        cell.favoritesNameLabel.text = cellInfo.placeName
        cell.favoritesAddressLabel.text = cellInfo.address
        cell.backgroundColor = #colorLiteral(red: 0.5557976961, green: 0.7569350004, blue: 0.892960012, alpha: 0.9393728596)
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor.blue.cgColor
        cell.backgroundColor = .clear

    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
