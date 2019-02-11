//
//  ListsViewController.swift
//  FourSquareReplica
//
//  Created by Stephanie Ramirez on 2/8/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//

import UIKit

class ListsViewController: UIViewController {

    let listsView = ListsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        self.view.addSubview(listsView)
        listsView.folderCollectionView.delegate = self
        listsView.folderCollectionView.dataSource = self
    }

}
extension ListsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       let dest =  ListsDetailViewController()
    navigationController?.pushViewController(dest, animated: true)
    }
}

extension ListsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listsView.createbutton.tag
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
guard let cell = listsView.folderCollectionView.dequeueReusableCell(withReuseIdentifier: "ListCell", for: indexPath) as? ListsCollectionViewCell else {return UICollectionViewCell()}
        
        
        return cell
    }
    
    
    
}
