//
//  FavoritesSearchVC.swift
//  FourSquareReplica
//
//  Created by Alyson Abril on 2/19/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//

import UIKit

class FavoritesSearchVC: UIViewController {

    var favoritesSearch = FavoritesSearchView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(favoritesSearch)
    }
    
}
