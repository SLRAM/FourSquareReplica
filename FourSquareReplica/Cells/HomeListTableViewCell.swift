//
//  HomeListTableViewCell.swift
//  FourSquareReplica
//
//  Created by Stephanie Ramirez on 2/8/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//

import UIKit

class HomeListTableViewCell: UITableViewCell {
    
    public lazy var cellImage: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "Placeholder"))
        return iv
    }()
    
    lazy var myLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Please Appear"
        return label
    }()
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
extension HomeListTableViewCell {
    func setConstraints() {
        setLabel()
        
    }
    func setLabel() {
        self.addSubview(myLabel)
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 11).isActive = true
        myLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 11).isActive = true
        myLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -11).isActive = true
    }
    
}
