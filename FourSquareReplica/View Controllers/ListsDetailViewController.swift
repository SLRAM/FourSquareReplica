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
    }
}
