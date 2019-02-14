//
//  HomeDetailViewController.swift
//  FourSquareReplica
//
//  Created by Stephanie Ramirez on 2/12/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//

import UIKit

class HomeDetailViewController: UIViewController {

    private let homeDetailView = HomeDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(homeDetailView)
        homeDetailView.delegate = self

        //do this to mak nav clear
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.isTranslucent = true

    }
    


}
extension HomeDetailViewController: HomeDetailViewDelegate {
    func addToLists() {
        let alert = UIAlertController(title: "This location has been added to your list!", message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
