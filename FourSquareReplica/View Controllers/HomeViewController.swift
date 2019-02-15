
//
//  HomeViewController.swift
//  FourSquareReplica
//
//  Created by Stephanie Ramirez on 2/8/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    private let homeListView = HomeListView()
    private let homeMapView = HomeMapView()
//    lazy var homeMapView: UITextView = {
//        let textView = UITextView()
//        textView.textColor = .gray
//        textView.text = "MapView!"
//        textView.font = UIFont.boldSystemFont(ofSize: 25)
//        textView.textAlignment = .center
//
//        return textView
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeSearchBar()
        mapListButton()
        setupHomeView()
        // Do any additional setup after loading the view.
    }
//    func setConstraints() {
//        homeMapView.translatesAutoresizingMaskIntoConstraints = false
//        homeMapView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        homeMapView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//        homeMapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
//        homeMapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
//        homeMapView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor).isActive = true
//    }
    

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
