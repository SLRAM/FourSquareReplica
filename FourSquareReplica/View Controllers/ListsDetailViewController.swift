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
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(listDetailView)
        listDetailView.favoritesTV.dataSource = self
        listDetailView.favoritesTV.delegate = self
    }
 
}

extension ListsDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listDetailView.favoritesTV.dequeueReusableCell(withIdentifier: "ListTVCell", for: indexPath) as? ListsDetailTableViewCell else { return UITableViewCell()}
//        cell.favoritesImage.image = UIImage(named: "Placeholder")
        cell.favoritesNameLabel.text = "name of place"
        cell.backgroundColor = #colorLiteral(red: 0.5557976961, green: 0.7569350004, blue: 0.892960012, alpha: 0.9393728596)
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor.blue.cgColor
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
