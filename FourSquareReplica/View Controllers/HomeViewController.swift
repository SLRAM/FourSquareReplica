//
//  HomeViewController.swift
//  FourSquareReplica
//
//  Created by Stephanie Ramirez on 2/8/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//
import UIKit
import MapKit
<<<<<<< HEAD
=======

>>>>>>> qa
class HomeViewController: UIViewController {
    public let identifer = "marker"
    private let homeListView = HomeListView()
    private let homeMapView = HomeMapView()
<<<<<<< HEAD
    let initialLocation = CLLocation(latitude: 40.7301, longitude: -73.99246)
    let regionRadius: CLLocationDistance = 1000
=======
    private let searchbarView = SearchBarView()
    private var venues = [Venues]()
    let testingCoordinate = CLLocationCoordinate2D.init(latitude: 40.7484, longitude: -73.9857)
    
    private func getVenues(near: String, query: String) {
        FourSquareAPI.searchFourSquare(userLocation: testingCoordinate, near: near, query: query) { (appError, venues) in
            if let appError = appError {
                print("getVenue - \(appError)")
            } else if let venues = venues {
                self.venues = venues
                DispatchQueue.main.async {
                    self.homeListView.myTableView.reloadData()
                }
            }
        }
    }
    
>>>>>>> qa
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        makeSearchBar()
        mapListButton()
        setupHomeView()
<<<<<<< HEAD
        centerOnMap(location: initialLocation)
        homeMapView.mapView.delegate = self
    }
    func centerOnMap(location: CLLocation){
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        homeMapView.mapView.setRegion(coordinateRegion, animated: true)
    }
    
    
=======
        getVenues(near: "", query: "Sushi")
    }
>>>>>>> qa
    func makeSearchBar() {
        let searchBar = UISearchBar()
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        searchBar.delegate = self
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
        view.addSubview(searchbarView)
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
        return venues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = homeListView.myTableView.dequeueReusableCell(withIdentifier: "HomeListTableViewCell", for: indexPath) as? HomeListTableViewCell else {return UITableViewCell()}
        let venueToSet = venues[indexPath.row]
        cell.locationName.text = venueToSet.name
        cell.locationCategory.text = venueToSet.categories.first?.name
        cell.locationDistance.text = "\(venueToSet.location.distance.description) meters away"
//        cell.locationDescription.text =
        ImageAPIClient.getImages(venueID: venueToSet.id) { (appError, imageInfo) in
            if let appError = appError {
                print(appError)
            }else if let imageInfo = imageInfo {
                if let imageCache = ImageHelper.fetchImageFromCache(urlString: imageInfo) {
                    DispatchQueue.main.async {
                        cell.cellImage.image = imageCache
                    }
                } else {
                    ImageHelper.fetchImageFromNetwork(urlString: imageInfo, completion: { (appError, image) in
                        if let appError = appError {
                            print("imageHelper error - \(appError)")
                        } else if let image = image {
                            cell.cellImage.image = image
                        }
                    })
                }
            }
        }
        


        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedCell = homeListView.myTableView.cellForRow(at: indexPath) as? HomeListTableViewCell else {return}
        let venue = venues[indexPath.row]
        let detailVC = HomeDetailViewController()
        detailVC.venue = venue
        detailVC.homeDetailView.detailImageView.image = selectedCell.cellImage.image
        //        detailVC
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
}
<<<<<<< HEAD
extension HomeViewController: MKMapViewDelegate{
    //mapView(_:viewFor:) gets called for every annotation you add to the map (just like tableView(_:cellForRowAt:) when working with table views), to return the view for each annotation.
    //step 1
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        
//    }
    //step 2 create a guard for the annotations for the model TODO
    
    //step 3:  To make markers appear, you create each view as an MKMarkerAnnotationView.
    
=======

extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let searchText = searchBar.text else { return }
        if searchText.lowercased().contains("near") {
            print("contains near")
        }
        print(searchText)
        getVenues(near: "", query: searchText)
        //userdefaults here
    }
>>>>>>> qa
}
