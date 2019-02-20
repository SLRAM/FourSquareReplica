//
//  ListsCollectionViewCell.swift
//  FourSquareReplica
//
//  Created by Stephanie Ramirez on 2/8/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//

import UIKit

class ListsCollectionViewCell: UICollectionViewCell {
    
    lazy var folderTitle: UILabel = {
    let label = UILabel()
    label.text = "Do i work"
    label.textAlignment = .center
    return label
    }()
    
    lazy var blurry: UIVisualEffectView = {
        var blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        var blurView = UIVisualEffectView(effect: blurEffect)
         blurView.backgroundColor = .red
        return blurView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //self.backgroundColor = .blue
        Constraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func Constraints() {
        addSubview(blurry)
        addSubview(folderTitle)
        folderTitle.translatesAutoresizingMaskIntoConstraints = false
        folderTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        folderTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        folderTitle.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -88).isActive = true
        
        blurry.translatesAutoresizingMaskIntoConstraints = false
        blurry.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1).isActive = true
        blurry.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        
    }
    
}



