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
    
    override func viewWillAppear(_ animated: Bool) {
        listsView.folderCollectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        self.view.addSubview(listsView)
        listsView.folderCollectionView.delegate = self
        listsView.folderCollectionView.dataSource = self
        listsView.createbutton.addTarget(self, action: #selector(CreateFolderCells), for: .touchUpInside)
    }

    @objc func CreateFolderCells() {
          present(FolderCreationViewController(), animated: true, completion: nil)
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
