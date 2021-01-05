//
//  ViewController.swift
//  Tweets Analysis
//
//  Created by Elina Mansurova on 2021-01-05.
//

import UIKit

class ViewController: UIViewController {
    
    var headerView: UIView!
    var textField: UITextField!
    var predictButton: UIButton!
    var sentiment: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        headerView = UIView()
        headerView.backgroundColor = .blue
        self.view.addSubview(headerView)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        headerView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
        headerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.15).isActive = true
        
        
    }


}

