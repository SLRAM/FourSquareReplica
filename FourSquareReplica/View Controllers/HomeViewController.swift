//
//  HomeViewController.swift
//  FourSquareReplica
//
//  Created by Stephanie Ramirez on 2/8/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//
import UIKit
import MapKit
class HomeViewController: UIViewController {
    public let identifer = "marker"
    private let homeListView = HomeListView()
    private let homeMapView = HomeMapView()
    let initialLocation = CLLocation(latitude: 40.7301, longitude: -73.99246)
    let regionRadius: CLLocationDistance = 1000
    override func viewDidLoad() {
        super.viewDidLoad()
        makeSearchBar()
        mapListButton()
        setupHomeView()
        centerOnMap(location: initialLocation)
        homeMapView.mapView.delegate = self
    }
    func centerOnMap(location: CLLocation){
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        homeMapView.mapView.setRegion(coordinateRegion, animated: true)
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
//        cell.locationName.text = indexPath.row.description
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedCell = homeListView.myTableView.cellForRow(at: indexPath) as? HomeListTableViewCell else {return}

        let detailVC = HomeDetailViewController()
        //        detailVC
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
}
extension HomeViewController: MKMapViewDelegate{
    //mapView(_:viewFor:) gets called for every annotation you add to the map (just like tableView(_:cellForRowAt:) when working with table views), to return the view for each annotation.
    //step 1
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        
//    }
    //step 2 create a guard for the annotations for the model TODO
    
    //step 3:  To make markers appear, you create each view as an MKMarkerAnnotationView.
    
}
