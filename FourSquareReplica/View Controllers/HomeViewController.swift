//
//  HomeViewController.swift
//  FourSquareReplica
//
//  Created by Stephanie Ramirez on 2/8/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//
import UIKit
import MapKit
import CoreLocation

class HomeViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    
    private let homeView = HomeView()
    private var venues = [Venues]()
    let testingCoordinate = CLLocationCoordinate2D.init(latitude: 40.7484, longitude: -73.9857)
    var query = String()
    var location = String()
    var statusRawValue = Int32()
    
    private func getVenues(near: String, query: String) {
        FourSquareAPI.searchFourSquare(userLocation: testingCoordinate, near: near, query: query) { (appError, venues) in
            if let appError = appError {
                print("getVenue - \(appError)")
            } else if let venues = venues {
                self.venues = venues
                DispatchQueue.main.async {
                    self.homeView.myTableView.reloadData()
                    dump(venues)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            //we need to say how accurate the data should be
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            homeView.mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
            homeView.mapView.showsUserLocation = true
        }
        mapListButton()
        getVenues(near: "miami", query: "Taco")
        homeView.delegate = self
        homeViewSetup()
    }
    
    func mapListButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Map", style: .plain, target: self, action: #selector(toggle))
    }
    @objc func toggle() {
        print("pressed toggle")
        if statusRawValue != 4 && (homeView.locationTextField.text?.isEmpty)! {
            let alertController = UIAlertController(title: "Please provide a search location or allow this app access to your location to see this feature.", message: nil, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            let settingsAction = UIAlertAction(title: "Open Settings", style: .default, handler: { (action) -> Void in
                if let url = URL(string:UIApplication.openSettingsURLString) {
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
            })
            alertController.addAction(okAction)
            alertController.addAction(settingsAction)
            present(alertController, animated: true)
        } else {
            if navigationItem.rightBarButtonItem?.title == "List" {
                navigationItem.rightBarButtonItem?.title = "Map"
            } else {
                navigationItem.rightBarButtonItem?.title = "List"
            }
            homeViewSetup()
        }
    }
    func homeViewSetup() {
        view.addSubview(homeView)
        homeView.myTableView.delegate = self
        homeView.myTableView.dataSource = self

        if navigationItem.rightBarButtonItem?.title == "Map" {
            UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
                self.homeView.mapView.alpha = 0.0
            })
        } else {
            UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
                self.homeView.mapView.alpha = 1.0
            })
        }
    }
    func leaveMap() {
        self.homeView.mapView.alpha = 0.0
        navigationItem.rightBarButtonItem?.title == "List"
        
    }
    
}
extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = homeView.myTableView.dequeueReusableCell(withIdentifier: "HomeListTableViewCell", for: indexPath) as? HomeListTableViewCell else {return UITableViewCell()}
        let venueToSet = venues[indexPath.row]
        cell.locationName.text = "\(indexPath.row + 1). \(venueToSet.name)"
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
        guard let selectedCell = homeView.myTableView.cellForRow(at: indexPath) as? HomeListTableViewCell else {return}
        let venue = venues[indexPath.row]
        let detailVC = HomeDetailViewController()
        detailVC.venue = venue
        detailVC.homeDetailView.detailImageView.image = selectedCell.cellImage.image
        //        detailVC
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == homeView.queryTextField {
            print("query: \(String(describing: textField.text))")
            //guard for textfield stuff
            query = textField.text ?? ""
        }
        if textField == homeView.locationTextField {
            print("location: \(String(describing: textField.text))")
            location = textField.text ?? ""
        }
        getVenues(near: location, query: query)
        
        return true
    }
}

extension HomeViewController: HomeViewDelegate {
    func userLocationButton() {
        if statusRawValue == 4 {
            if homeView.nearMeButton.backgroundColor == #colorLiteral(red: 0.6193930507, green: 0.7189580798, blue: 0.9812330604, alpha: 1)  {
                homeView.nearMeButton.backgroundColor = #colorLiteral(red: 0.4481958747, green: 0.5343003273, blue: 0.7696674466, alpha: 1)
                print("highlighted")
                homeView.locationTextField.text = "near me"
                homeView.locationTextField.isEnabled = false
            } else {
                homeView.nearMeButton.backgroundColor = #colorLiteral(red: 0.6193930507, green: 0.7189580798, blue: 0.9812330604, alpha: 1)
                homeView.locationTextField.isEnabled = true
                homeView.locationTextField.text = ""
                homeView.locationTextField.placeholder = "ex. Miami"
                print("not highlighted")
            }
        } else {
            let alertController = UIAlertController(title: "Please allow this app to access your user location in settings to enable this feature.", message: nil, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            let settingsAction = UIAlertAction(title: "Open Settings", style: .default, handler: { (action) -> Void in
                if let url = URL(string:UIApplication.openSettingsURLString) {
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
            })
            alertController.addAction(okAction)
            alertController.addAction(settingsAction)
            present(alertController, animated: true)
        }
    }
}
extension HomeViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        //this kicks off whenever authorization is turned on or off
        print("user changed the authorization")
        statusRawValue = status.rawValue
        if statusRawValue != 4 && homeView.mapView.alpha == 1.0 {
            leaveMap()
        } else {
            let currentLocation = homeView.mapView.userLocation
            let myCurrentRegion = MKCoordinateRegion(center: currentLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            homeView.mapView.setRegion(myCurrentRegion, animated: true)
        }
        print(status.rawValue)
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //this kicks off whenever the user's location has noticeably changed
        print("user has changed locations")
        guard let currentLocation = locations.last else {return}
        print("The user is in lat: \(currentLocation.coordinate.latitude) and long:\(currentLocation.coordinate.longitude)")
        let myCurrentRegion = MKCoordinateRegion(center: currentLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        
        homeView.mapView.setRegion(myCurrentRegion, animated: true)
    }
}
