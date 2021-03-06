//
//  HomeDetailView.swift
//  FourSquareReplica
//
//  Created by Stephanie Ramirez on 2/12/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//

import UIKit
protocol HomeDetailViewDelegate: AnyObject {
    func addToLists()
}

class HomeDetailView: UIView {
    weak var delegate: HomeDetailViewDelegate?

    public lazy var detailImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "Placeholder"))
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = .clear
        label.text = "Location Name"
        label.font = UIFont(name: "AvenirNext-Bold", size: 18)
        return label
    }()
    lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
//        label.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.text = "Location Address"
        label.font = UIFont(name: "Avenir Next", size: 16)
        return label
    }()
    lazy var distanceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
//        label.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.text = "Location Hours"
        label.font = UIFont(name: "Avenir Next", size: 16)
        return label
    }()
    lazy var categoriesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
//        label.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.text = "Location Categories"
        label.font = UIFont(name: "Avenir Next", size: 16)
        return label
    }()
    
    public lazy var addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "addIconFilled"), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.5187909007, green: 0.6190392375, blue: 1, alpha: 1)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(addedPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func addedPressed() {
        delegate?.addToLists()
        print("added pressed")
        
    }

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        addButton.layer.cornerRadius = addButton.bounds.width / 2.0
        addButton.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        backgroundColor = .white
        setupDetailView()
    }
    
}
extension HomeDetailView {
    func setupDetailView() {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.magenta.cgColor,UIColor.red.cgColor,UIColor.purple.cgColor,UIColor.blue.cgColor]
        self.layer.addSublayer(gradient)
        
        detailImage()
        detailNameLabel()
        detailAddressLabel()
        detailHoursLabel()
        detailCategoryLabel()
        detailAddButton()
    }
    func detailImage() {
        addSubview(detailImageView)
        detailImageView.translatesAutoresizingMaskIntoConstraints = false
        detailImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        detailImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.50).isActive = true
        detailImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 1.0).isActive = true
        detailImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    func detailNameLabel() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.bottomAnchor.constraint(equalTo: detailImageView.bottomAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: detailImageView.heightAnchor, multiplier: 0.20).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 1.0).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
    }
    func detailAddressLabel() {
        addSubview(addressLabel)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.topAnchor.constraint(equalTo: detailImageView.bottomAnchor).isActive = true
        addressLabel.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.15).isActive = true
        addressLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 1.0).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
    }
    func detailHoursLabel() {
        addSubview(distanceLabel)
        distanceLabel.translatesAutoresizingMaskIntoConstraints = false
        distanceLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor).isActive = true
        distanceLabel.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.15).isActive = true
        distanceLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 1.0).isActive = true
        distanceLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
    }
    func detailCategoryLabel() {
        addSubview(categoriesLabel)
        categoriesLabel.translatesAutoresizingMaskIntoConstraints = false
        categoriesLabel.topAnchor.constraint(equalTo: distanceLabel.bottomAnchor).isActive = true
        categoriesLabel.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.20).isActive = true
        categoriesLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 1.0).isActive = true
        categoriesLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
    }
    func detailAddButton() {
        addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.25).isActive = true
        addButton.heightAnchor.constraint(equalTo: addButton.widthAnchor, multiplier: 1.0).isActive = true
        addButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        addButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
