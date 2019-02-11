
//
//  HomeViewController.swift
//  FourSquareReplica
//
//  Created by Stephanie Ramirez on 2/8/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
//Private properties
    private let homeListView = HomeListView()
    private let homeMapView = HomeMapView()
    override func viewDidLoad() {
        super.viewDidLoad()
        makeSearchBar()
        mapListButton()
        setupHomeView()
        // Do any additional setup after loading the view.
    }
    func makeSearchBar() {
        let searchBar = UISearchBar()
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
    }
    func mapListButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "List", style: .plain, target: self, action: #selector(toggle))
    }
    @objc func toggle() {
        print("pressed toggle")
        if navigationItem.rightBarButtonItem?.title == "List" {
            navigationItem.rightBarButtonItem?.title = "Map"
        } else {
            navigationItem.rightBarButtonItem?.title = "List"
        }
        setupHomeView()
        
    }
    func setupHomeView() {
        if navigationItem.rightBarButtonItem?.title == "List" {
            self.view.addSubview(homeListView)
            homeListView.myTableView.dataSource = self
            homeListView.myTableView.delegate = self
            
            //self.view.addSubview(quizView)
            //quizView.myQuizCollectionView.reloadData()
        } else {
            self.view.addSubview(homeMapView)
//            setConstraints()
            homeMapView.reloadInputViews()
            //self.view.addSubview(emptyQuizView)
            //emptyQuizView.firstQuizTextView.reloadInputViews()
        }
    }


}
extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = homeListView.myTableView.dequeueReusableCell(withIdentifier: "HomeListTableViewCell", for: indexPath) as? HomeListTableViewCell else {return UITableViewCell()}
        //        cell.textLabel?.text = indexPath.row.description
        cell.myLabel.text = indexPath.row.description
        return cell
    }
    
    
}
