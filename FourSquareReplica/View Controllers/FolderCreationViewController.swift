//
//  FolderCreationViewController.swift
//  FourSquareReplica
//
//  Created by Pursuit on 2/15/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//

import UIKit

class FolderCreationViewController: UIViewController {
    
    let folderCreation = FoldercreationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(folderCreation)
        //self.view.backgroundColor = .purple
        //self.view.backgroundColor = #colorLiteral(red: 0.6879978776, green: 0, blue: 0.8818469644, alpha: 0.243878866)
        
    }
    
    
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
