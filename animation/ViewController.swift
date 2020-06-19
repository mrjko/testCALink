//
//  ViewController.swift
//  animation
//
//  Created by Jimmy Ko on 2020-06-18.
//  Copyright © 2020 Jimmy Ko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    var startValue: Double = 0
    var endValue: Double = 67
    let animationDuration: Double = 0.75
    let animationStartDate = Date()
    
    var currentTextIndex = 0
    let paragraph = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let numberLink = CADisplayLink(target: self, selector: #selector(handleNumberUpdate))
        numberLink.add(to: .main, forMode: .default)
        
        textLabel.numberOfLines = 5
        textLabel.font = UIFont.systemFont(ofSize: 40, weight: .light)
        numberLabel.font = UIFont.systemFont(ofSize: 80, weight: .bold)
    
        let textLink = CADisplayLink(target: self, selector: #selector(handleTextUpdate))
        textLink.add(to: .main, forMode: .default)
        
    }
    
    @objc func handleNumberUpdate() {
        let now = Date()
        let elapsedTime = now.timeIntervalSince(animationStartDate)
        
        if elapsedTime > animationDuration {
            numberLabel.text = "\(Int(endValue))"
        } else {
            let percentage = elapsedTime / animationDuration
            let value = percentage * (endValue - startValue)
            numberLabel.text = "\(Int(value))"
        }
    }
    
    
    @objc func handleTextUpdate() {
        let now = Date()
        let elapsedTime = now.timeIntervalSince(animationStartDate)
        
        if elapsedTime > animationDuration {
            textLabel.text = paragraph
        } else {
            let start = paragraph.startIndex
            let percentage = elapsedTime / animationDuration
            let value = percentage * Double(paragraph.count)
            let upper = value.rounded()
            let end = paragraph.index(start, offsetBy: Int(upper))
            let range = start..<end
            textLabel.text = String(paragraph[range])
            currentTextIndex += 1
        }
    }
    
}

