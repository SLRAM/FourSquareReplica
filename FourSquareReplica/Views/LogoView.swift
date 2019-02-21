//
//  LogoView.swift
//  FourSquareReplica
//
//  Created by Stephanie Ramirez on 2/20/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//

import UIKit
protocol LogoViewDelegate: AnyObject {
    func queryTerm(query: String)
}

class LogoView: UIView {
    
    weak var delegate: LogoViewDelegate?
    
    public lazy var detailImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "Placeholder"))
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    lazy var myButtonView: UIView = {
        let myv = UIView()
        myv.backgroundColor = .white
        return myv
    }()
    
    public lazy var breakfastButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "1"), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.5187909007, green: 0.6190392375, blue: 1, alpha: 1)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(breakfastPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func breakfastPressed() {
        print("breakfast pressed")
        delegate?.queryTerm(query: "breakfast")
        
    }
    
    public lazy var lunchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "2"), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.5187909007, green: 0.6190392375, blue: 1, alpha: 1)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(lunchPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func lunchPressed() {
        print("lunch pressed")
        delegate?.queryTerm(query: "lunch")
        
    }
    
    public lazy var dinnerButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "3"), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.5187909007, green: 0.6190392375, blue: 1, alpha: 1)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(dinnerPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func dinnerPressed() {
        print("dinner pressed")
        delegate?.queryTerm(query: "dinner")
        
    }
    public lazy var coffeeTeaButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "4"), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.5187909007, green: 0.6190392375, blue: 1, alpha: 1)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(coffeeTeaPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func coffeeTeaPressed() {
        print("Coffe & Tea pressed")
        delegate?.queryTerm(query: "coffee & tea")
        
    }
    public lazy var nightlifeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "5"), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.5187909007, green: 0.6190392375, blue: 1, alpha: 1)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(nightlifePressed), for: .touchUpInside)
        return button
    }()
    
    @objc func nightlifePressed() {
        print("Nightlife pressed")
        delegate?.queryTerm(query: "nightlife")
        
    }
    public lazy var thingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "6"), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.5187909007, green: 0.6190392375, blue: 1, alpha: 1)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(thingsPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func thingsPressed() {
        print("things to do pressed")
        delegate?.queryTerm(query: "things to do")
        
    }

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
                backgroundColor = .white
        setupLogoView()
    }
}
extension LogoView {
    func setupLogoView() {
        setupImageView()
        setupButtonView()
        setupbuttons()
    }
    func setupImageView() {
        addSubview(detailImageView)
        detailImageView.translatesAutoresizingMaskIntoConstraints = false
        detailImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        detailImageView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
        detailImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 1.0).isActive = true
        detailImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
    }
    func setupButtonView() {
        addSubview(myButtonView)
        myButtonView.translatesAutoresizingMaskIntoConstraints = false
        myButtonView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        myButtonView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
        myButtonView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 1.0).isActive = true
        myButtonView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
    }
    func setupbuttons() {
        setupLunchButton()
        setupBreakfastButton()
        setupDinnerButton()
        setupNightlifeButton()

        setupCoffeeTeaButton()
        setupThingsButton()
    }
    func setupBreakfastButton() {
        addSubview(breakfastButton)
        breakfastButton.translatesAutoresizingMaskIntoConstraints = false
        breakfastButton.topAnchor.constraint(equalTo: myButtonView.topAnchor).isActive = true
        breakfastButton.trailingAnchor.constraint(equalTo: lunchButton.leadingAnchor).isActive = true
        breakfastButton.heightAnchor.constraint(equalTo: myButtonView.heightAnchor, multiplier: 0.5).isActive = true
        breakfastButton.widthAnchor.constraint(equalTo: myButtonView.widthAnchor, multiplier: 0.33).isActive = true
    }
    func setupLunchButton() {
        addSubview(lunchButton)
        lunchButton.translatesAutoresizingMaskIntoConstraints = false
        lunchButton.topAnchor.constraint(equalTo: myButtonView.topAnchor).isActive = true
//        lunchButton.leadingAnchor.constraint(equalTo: breakfastButton.trailingAnchor).isActive = true
        lunchButton.heightAnchor.constraint(equalTo: myButtonView.heightAnchor, multiplier: 0.5).isActive = true
        lunchButton.widthAnchor.constraint(equalTo: myButtonView.widthAnchor, multiplier: 0.33).isActive = true
        lunchButton.centerXAnchor.constraint(equalTo: myButtonView.centerXAnchor).isActive = true
    }
    func setupDinnerButton() {
        addSubview(dinnerButton)
        dinnerButton.translatesAutoresizingMaskIntoConstraints = false
        dinnerButton.topAnchor.constraint(equalTo: myButtonView.topAnchor).isActive = true
        dinnerButton.leadingAnchor.constraint(equalTo: lunchButton.trailingAnchor).isActive = true
        dinnerButton.heightAnchor.constraint(equalTo: myButtonView.heightAnchor, multiplier: 0.5).isActive = true
        dinnerButton.widthAnchor.constraint(equalTo: myButtonView.widthAnchor, multiplier: 0.33).isActive = true
    }
    func setupCoffeeTeaButton() {
        addSubview(coffeeTeaButton)
        coffeeTeaButton.translatesAutoresizingMaskIntoConstraints = false
        coffeeTeaButton.bottomAnchor.constraint(equalTo: myButtonView.bottomAnchor).isActive = true
        coffeeTeaButton.trailingAnchor.constraint(equalTo: nightlifeButton.leadingAnchor).isActive = true
        coffeeTeaButton.heightAnchor.constraint(equalTo: myButtonView.heightAnchor, multiplier: 0.5).isActive = true
        coffeeTeaButton.widthAnchor.constraint(equalTo: myButtonView.widthAnchor, multiplier: 0.33).isActive = true
    }
    func setupNightlifeButton() {
        addSubview(nightlifeButton)
        nightlifeButton.translatesAutoresizingMaskIntoConstraints = false
        nightlifeButton.bottomAnchor.constraint(equalTo: myButtonView.bottomAnchor).isActive = true
        //        lunchButton.leadingAnchor.constraint(equalTo: breakfastButton.trailingAnchor).isActive = true
        nightlifeButton.heightAnchor.constraint(equalTo: myButtonView.heightAnchor, multiplier: 0.5).isActive = true
        nightlifeButton.widthAnchor.constraint(equalTo: myButtonView.widthAnchor, multiplier: 0.33).isActive = true
        nightlifeButton.centerXAnchor.constraint(equalTo: myButtonView.centerXAnchor).isActive = true
    }
    func setupThingsButton() {
        addSubview(thingsButton)
        thingsButton.translatesAutoresizingMaskIntoConstraints = false
        thingsButton.bottomAnchor.constraint(equalTo: myButtonView.bottomAnchor).isActive = true
        thingsButton.leadingAnchor.constraint(equalTo: nightlifeButton.trailingAnchor).isActive = true
        thingsButton.heightAnchor.constraint(equalTo: myButtonView.heightAnchor, multiplier: 0.5).isActive = true
        thingsButton.widthAnchor.constraint(equalTo: myButtonView.widthAnchor, multiplier: 0.33).isActive = true
    }
    
}
