//
//  HomeDetailViewController.swift
//  FourSquareReplica
//
//  Created by Stephanie Ramirez on 2/12/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//

import UIKit
import MapKit

class HomeDetailViewController: UIViewController {

    let homeDetailView = HomeDetailView()
    var venue: Venues?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(homeDetailView)
        homeDetailView.delegate = self

        //do this to mak nav clear
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.isTranslucent = true

        homeDetailView.nameLabel.text = venue?.name
        homeDetailView.addressLabel.text = venue?.location.address
//        homeDetailView.hoursLabel.text =
        homeDetailView.categoriesLabel.text = venue?.categories.first?.name
    }
    


}
extension HomeDetailViewController: HomeDetailViewDelegate {
    func addToLists() {
        let optionMenu = UIAlertController(title: nil, message: "Options:", preferredStyle: .actionSheet)
        let  tipAction = UIAlertAction(title: "Add A Tip", style: .default, handler: { (action) -> Void in
            
        })
        let  addAction = UIAlertAction(title: "Add To Lists", style: .default, handler: { (action) -> Void in

            self.navigationController?.pushViewController(ListsViewController(), animated: true)
        })
        
        let directionsAction = UIAlertAction(title: "Get Directions", style: .default, handler: { (action) -> Void in
            guard let venueLat = self.venue?.location.lat,
                let venueLong = self.venue?.location.lng else {return}
            let coordinate = CLLocationCoordinate2DMake(venueLat,venueLong)
            let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary:nil))
            mapItem.name = "Target location"
            mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        optionMenu.addAction(tipAction)
        optionMenu.addAction(addAction)
        optionMenu.addAction(directionsAction)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
    }
    
}
