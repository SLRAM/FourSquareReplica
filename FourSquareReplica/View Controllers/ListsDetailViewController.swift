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
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listDetailView.favoritesTV.dequeueReusableCell(withIdentifier: "ListTVCell", for: indexPath) as? ListsDetailTableViewCell else { return UITableViewCell()}
        cell.favoritesLabel.text = "Hello"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
