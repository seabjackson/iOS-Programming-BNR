//
//  ViewController.swift
//  Quiz
//
//  Created by lily on 12/22/15.
//  Copyright © 2015 Seab Jackson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
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
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        
        animateLabelTransitions()
    }
    
    @IBAction func showAnswer(sender: AnyObject) {
        let answer: String = answers[currentQuestionnIndex]
        answerLabel.text = answer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let question = questions[currentQuestionnIndex]
        currentQuestionLabel.text = question
        
        // nextQuestionLabel starts from off the screen
        updateOffScreenLabel()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set the label's initial alpha
        nextQuestionLabel.alpha = 0
    }
    
    func animateLabelTransitions() {
        
        // Force any outstanding layout changes to occur
        view.layoutIfNeeded()
        
        // Animate the alpha
        // and the center X constraints
        let screenWidth = view.frame.width
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth
        UIView.animateWithDuration(0.5, delay: 0, options: [.CurveLinear], animations: {
            self.currentQuestionLabel.alpha = 0
            self.nextQuestionLabel.alpha = 1
            
            self.view.layoutIfNeeded()
            }, completion: { _ in
                swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
                swap(&self.currentQuestionLabelCenterXConstraint, &self.nextQuestionLabelCenterXConstraint)
                
                self.updateOffScreenLabel()
        })
    }
    
    func updateOffScreenLabel() {
        let screenWidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = -screenWidth
    }
}

