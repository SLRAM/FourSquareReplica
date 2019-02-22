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
    public let identifer = "marker"
    private let homeListView = HomeListView()

   
    private let searchbarView = SearchBarView()
    private var venues = [Venues]()
//    let testingCoordinate = CLLocationCoordinate2D.init(latitude: 40.7484, longitude: -73.9857)
    var query : String?
    var near = String()
    var locationString = String()
    var statusRawValue = Int32()
    var userLocation : CLLocationCoordinate2D?
    var updatedUserLocation = CLLocationCoordinate2D()
    
    private func getVenues(userLocation: CLLocationCoordinate2D, near: String, query: String) {
        FourSquareAPI.searchFourSquare(userLocation: userLocation, near: near, query: query) { (appError, venues) in
            if let appError = appError {
                print("getVenue - \(appError)")
            } else if let venues = venues {
                self.venues = venues
                DispatchQueue.main.async {
                    self.homeView.reloadInputViews()
                    self.homeView.myTableView.reloadData()
                    self.homeView.mapView.reloadInputViews()
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
        setupLocation()
        homeView.delegate = self
        
        homeViewSetup()
//        centerOnMap(location: initialLocation)
        homeView.mapView.delegate = self
        
        homeView.locationTextField.delegate = self
        homeView.queryTextField.delegate = self
       // setupAnnotations()
    }
    func setupLocation() {
        guard let userLocation = userLocation,
            let query = query else {return}
        switch userLocation.latitude {
        case 0.0:
            near = "NYC"
            homeView.locationTextField.text = near
            locationString = near
            if !query.isEmpty {
                //if user deny and no query = use near only
                homeView.queryTextField.text = query
            }
            getVenues(userLocation: userLocation, near: near, query: query)
        default:
            homeView.locationTextField.text = "near me"
            homeView.locationTextField.isEnabled = false
            homeView.nearMeButton.setImage(UIImage(named: "icons8-location_filled"), for: .normal)
            let myCurrentRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: 9000, longitudinalMeters: 9000)
            homeView.mapView.setRegion(myCurrentRegion, animated: true)

//            homeView.nearMeButton.backgroundColor = #colorLiteral(red: 0.4481958747, green: 0.5343003273, blue: 0.7696674466, alpha: 1)
            if !query.isEmpty {
                //if user accept and no query = use user location only
                homeView.queryTextField.text = query
            }
            getVenues(userLocation: userLocation, near: "", query: query)
        }
//        else {
//            //fix this case. use blank query and correct user location info keep for search bar blank query push
//            getVenues(userLocation: updatedUserLocation, near: "nyc", query: "")
//
//        }
    }
    func setupAnnotations(){
        let allAnnotations = self.homeView.mapView.annotations
        self.homeView.mapView.removeAnnotations(allAnnotations)
        for venue in venues {
            let regionRadius: CLLocationDistance = 9000
            let coordinate = CLLocationCoordinate2D.init(latitude: venue.location.lat!, longitude: venue.location.lng!)
            let coordinateRegion = MKCoordinateRegion.init(center: coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = venue.name
            annotation.subtitle = venue.location.address
            homeView.mapView.setRegion(coordinateRegion, animated: true)
            homeView.mapView.addAnnotation(annotation)
            
        }
        let myCurrentRegion = MKCoordinateRegion(center: venues[0].location.coordinate, latitudinalMeters: 9000, longitudinalMeters: 9000)
        homeView.mapView.setRegion(myCurrentRegion, animated: true)

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
            self.view.addSubview(homeView)
            setupAnnotations()
            homeView.reloadInputViews()
        }
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
        let venueDistance = venueToSet.location.distance?.description ?? " "
        cell.locationDistance.text = "Distance in meters: \(venueDistance)"
        let addressCount = venueToSet.location.formattedAddress.count
        
      
        cell.locationDescription.numberOfLines = addressCount
        var newStr = ""
        for str in venueToSet.location.formattedAddress {
            newStr += str + "\n"
        }
        cell.locationDescription.text = newStr
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
//        UIView.animate(withDuration: 5.5, delay: 0.0, options: [], animations: {
//        })
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
extension HomeViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }
        
        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.rightCalloutAccessoryView = UIButton(type: .infoLight)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }
        return annotationView
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let destinationVC = HomeDetailViewController()
     navigationController?.pushViewController(destinationVC, animated: true)
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
            locationString = textField.text ?? ""
        }
        if let query = query,
            let userLocation = userLocation {
           getVenues(userLocation: userLocation, near: locationString, query: query)
            setupAnnotations()
        }
        
        textField.resignFirstResponder()
        return true
    }
}

extension HomeViewController: HomeViewDelegate {
    func userLocationButton() {
        if statusRawValue == 4 {
            if homeView.nearMeButton.currentImage == UIImage(named: "icons8-marker") {
//            if homeView.nearMeButton.backgroundColor == #colorLiteral(red: 0.6193930507, green: 0.7189580798, blue: 0.9812330604, alpha: 1)  {
                homeView.nearMeButton.setImage(UIImage(named: "icons8-location_filled"), for: .normal)
//                homeView.nearMeButton.backgroundColor = #colorLiteral(red: 0.4481958747, green: 0.5343003273, blue: 0.7696674466, alpha: 1)
                print("highlighted")
                homeView.locationTextField.text = "near me"
                homeView.locationTextField.isEnabled = false
                guard let query = query else {return}
                getVenues(userLocation: updatedUserLocation, near: "", query: query)
            } else {
                homeView.nearMeButton.setImage(UIImage(named: "icons8-marker"), for: .normal)
//                homeView.nearMeButton.backgroundColor = #colorLiteral(red: 0.6193930507, green: 0.7189580798, blue: 0.9812330604, alpha: 1)
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
        print("user changed the authorization")
        statusRawValue = status.rawValue
        locationManager.startUpdatingLocation()
        let currentLocation = homeView.mapView.userLocation
        let myCurrentRegion = MKCoordinateRegion(center: currentLocation.coordinate, latitudinalMeters: 9000, longitudinalMeters: 9000)
        homeView.mapView.setRegion(myCurrentRegion, animated: true)
        print(status.rawValue)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("user has changed locations")
        guard let currentLocation = locations.last else {return}
        updatedUserLocation = currentLocation.coordinate
        print("The user is in lat: \(currentLocation.coordinate.latitude) and long:\(currentLocation.coordinate.longitude)")
//        let myCurrentRegion = MKCoordinateRegion(center: currentLocation.coordinate, latitudinalMeters: 9000, longitudinalMeters: 9000)
//        homeView.mapView.setRegion(myCurrentRegion, animated: true)
//        getVenues(userLocation: updatedUserLocation, near: "", query: "Taco")
    }
}

