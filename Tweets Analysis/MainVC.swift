//
//  ViewController.swift
//  Tweets Analysis
//
//  Created by Elina Mansurova on 2021-01-05.
//

import UIKit

class MainVC: UIViewController {
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "How do people feel about..."
        textField.backgroundColor = .white
        return textField
    }()
    lazy var predictButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
        button.setTitle("PREDICT", for: .normal)
        return button
    }()
    lazy var sentiment: UILabel = {
        let label = UILabel()
        label.text = "🤔"
        label.font = UIFont.systemFont(ofSize: 70)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        view.addSubview(stackView)
        
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        stackView.addArrangedSubview(sentiment)
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(predictButton)
        
        sentiment.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true
        textField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        textField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
    }


}

