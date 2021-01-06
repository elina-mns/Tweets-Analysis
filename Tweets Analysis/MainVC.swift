//
//  ViewController.swift
//  Tweets Analysis
//
//  Created by Elina Mansurova on 2021-01-05.
//

import UIKit
import SwifteriOS

class MainVC: UIViewController {
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .center
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
        label.font = UIFont.systemFont(ofSize: 100)
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
    
    let swifter = Swifter(consumerKey: "LTReJyreyyuz4SWjVABuA1WKI", consumerSecret: "ajf107xfd6869heCG8Ptn8iztfFHBWPIxLkFGvsmoEwI7MKZcz")
    
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
        textField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //returns a collection of tweets with a specified parameter
        swifter.searchTweet(using: "@Spotify", lang: "en", count: 100, tweetMode: .extended) { (results, metadata) in
            print(results)
        } failure: { (error) in
            print("Error with Twitter API request, \(error)")
        }

    }

    
    func predictIsTapped() {
        predictButton.sendActions(for: .touchUpInside)
    }
}

