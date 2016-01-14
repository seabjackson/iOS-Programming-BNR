//
//  ViewController.swift
//  Quiz
//
//  Created by lily on 12/22/15.
//  Copyright © 2015 Seab Jackson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    let questions: [String] = ["From what is cognac made?",
                              "What is 7+7?",
                              "What is the capital of Vermont"]
    
    let answers: [String] = ["Grapes",
                             "14",
                             "Montpelier"]
    
    var currentQuestionnIndex: Int = 0
    
    @IBAction func showNextQuestion(sender: AnyObject) {
        ++currentQuestionnIndex
        if currentQuestionnIndex == questions.count {
            currentQuestionnIndex = 0
        }
        
        let question: String = questions[currentQuestionnIndex]
        questionLabel.text = question
        answerLabel.text = "???"
    }
    
    @IBAction func showAnswer(sender: AnyObject) {
        let answer: String = answers[currentQuestionnIndex]
        answerLabel.text = answer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionnIndex]
    }
}

