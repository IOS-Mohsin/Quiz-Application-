//
//  ViewController.swift
//  Quiz Application Final
//
//  Created by See Sight Tours on 23/04/2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    var quizBrain = QuizBrain()
    
    override func viewDidLoad()
    {
       updateUI()
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton)
    {
        let userAnswer = sender.currentTitle! // True ,False
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight
        {
            sender.backgroundColor = UIColor.green
            sender.layer.cornerRadius = CGFloat (30.0)
        }
        else
        {
            sender.backgroundColor = UIColor.red
            sender.layer.cornerRadius = CGFloat (30.0)
        }
        
        quizBrain.nextQuestion()
        
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
            //used this timer to change the red and green color back to normal after 0.2 seconds
    }
    
    @objc func updateUI()
    {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear

    }
    
}
