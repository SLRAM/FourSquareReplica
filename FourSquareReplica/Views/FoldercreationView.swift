//
//  FoldercreationView.swift
//  FourSquareReplica
//
//  Created by Pursuit on 2/15/19.
//  Copyright © 2019 Stephanie Ramirez. All rights reserved.
//

import UIKit

class FoldercreationView: UIView {
    
    lazy var alertView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    lazy var TextFields: UITextField = {
        let textField = UITextField()
        
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.backgroundColor = #colorLiteral(red: 0.1342799664, green: 0.1250010133, blue: 0.853731811, alpha: 0.1402280468)
        self.isOpaque = true
        self.clearsContextBeforeDrawing = true
        SetUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func SetUp(){
        addSubview(alertView)
        alertView.translatesAutoresizingMaskIntoConstraints = false
        alertView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75).isActive = true
        alertView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        alertView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        alertView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
}
