//
//  ViewController.swift
//  Tweets Analysis
//
//  Created by Elina Mansurova on 2021-01-05.
//

import UIKit
import SwifteriOS
import CoreML
import SwiftyJSON

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
    
    let sentimentClassifier = TweetAnalysis()
        
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
        swifter.searchTweet(using: "@Dior", lang: "en", count: 100, tweetMode: .extended) { (results, metadata) in
            var tweets = [TweetAnalysisInput]()
            
            //adding tweets on a specified parameter to an array
            for i in 0..<100 {
                if let tweet = results[i]["full_text"].string {
                    let tweetForClassification = TweetAnalysisInput(text: tweet)
                    tweets.append(tweetForClassification)
                }
            }
            
            //calculation of tweets' score
            do {
                let predictions = try self.sentimentClassifier.predictions(inputs: tweets)
                var sentimentScore = 0
                for prediction in predictions {
                    let sentiment = prediction.label
                    if sentiment == "Pos" {
                        sentimentScore += 1
                    } else if sentiment == "Neg" {
                        sentimentScore -= 1
                    }
                }
                print(sentimentScore)
                
            } catch {
                print("There was an error with making a prediction \(error)")
            }
            
            
        } failure: { (error) in
            print("Error with Twitter API request, \(error)")
        }
        
    }

    
    func predictIsTapped() {
        predictButton.sendActions(for: .touchUpInside)
    }
}

