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
        listsView.createbutton.addTarget(self, action: #selector(createFolderCells), for: .touchUpInside)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        listsView.folderCollectionView.reloadData()
        self.listsView.createbutton.alpha = 1
    }

    
    
    @objc func createFolderCells() {
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseInOut], animations: {
            self.listsView.createbutton.transform = CGAffineTransform(rotationAngle: 40.055)
            let vc = FolderCreationViewController()
            vc.modalTransitionStyle = .flipHorizontal
            vc.modalPresentationStyle = .popover
            self.present(vc, animated: true, completion: nil)
            self.perform(#selector(self.something), with: self, afterDelay: 0.7)
        })
    }
    @objc func something(){
        UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
            self.listsView.createbutton.alpha = 0.0
            self.listsView.folderCollectionView.reloadData()
            self.listsView.createbutton.transform = CGAffineTransform(rotationAngle:0)
        })
    }
    
}
extension ListsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //add title to keep name on to titlelabel in lists detail view
        navigationController?.pushViewController(ListsDetailViewController(), animated: true)
    }
}

extension ListsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FolderModel.getItems().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
guard let cell = listsView.folderCollectionView.dequeueReusableCell(withReuseIdentifier: "ListCell", for: indexPath) as? ListsCollectionViewCell else {return UICollectionViewCell()}
       let folderInfo = FolderModel.getItems()[indexPath.row]
       cell.folderTitle.text = folderInfo.title
        return cell
    }
    
    
    
}
