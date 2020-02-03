//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    //The UI Elements from the storyboard   are already linked up for you.
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    // Button Text Label
    
    @IBOutlet weak var answer1Label: UIButton!
    @IBOutlet weak var answer2Label: UIButton!
    @IBOutlet weak var answer3Label: UIButton!
    @IBOutlet weak var answer4Label: UIButton!
    
  

    
    
    //Place your instance variables here
    
    let allQuestions = QuestionBank()
    var totalQuestion = Int()
    var pickedAnswer = String()
    var questionNumber : Int = 0
    var score : Int = 0
    
    let defaults = UserDefaults.standard
    

    // This gets called when the UIViewController is loaded into memory when the app starts
    override func viewDidLoad() {
        super.viewDidLoad()
         //progressBar.frame.size.width = (view.frame.size.width / 13) * 5
        totalQuestion = allQuestions.list.count
        print(totalQuestion)
        updateUI()
        
//        defaults.set("Hello", forKey: "key")
        if let data = defaults.value(forKey: "key") as? String {
            print(data)
        }
     }


    //This action gets called when either the true or false button is pressed.
    @IBAction func answerPressed(_ sender: AnyObject) {
        
    
        if sender.tag == 1 {
            pickedAnswer = allQuestions.list[questionNumber].answer1
        }
        
        else if sender.tag == 2 {
            pickedAnswer = allQuestions.list[questionNumber].answer2
        }
        else if sender.tag == 3 {
            pickedAnswer = allQuestions.list[questionNumber].answer3
        }
        else if sender.tag == 4 {
            pickedAnswer = allQuestions.list[questionNumber].answer4
        }
        
        checkAnswer()
        
        questionNumber = questionNumber + 1
        
        updateUI()
        
    }
    
    // This method will update all the views on screen (progress bar, score label, etc)
    func updateUI() {
        
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(totalQuestion)) * CGFloat(questionNumber)
        //print((view.frame.size.width / 13) * CGFloat(questionNumber))
        
        progressLabel.text = String(questionNumber) + "/\(totalQuestion))"
        
        scoreLabel.text = "Score: " + String(score)
      
        nextQuestion()
    }

    //This method will update the question text and check if we reached the end.
    func nextQuestion() {
        
        if questionNumber < totalQuestion {
            questionLabel.text = allQuestions.list[questionNumber].questionText
            answer1Label.setTitle(allQuestions.list[questionNumber].answer1, for: .normal)
            answer2Label.setTitle(allQuestions.list[questionNumber].answer2, for: .normal)
            answer3Label.setTitle(allQuestions.list[questionNumber].answer3, for: .normal)
            answer4Label.setTitle(allQuestions.list[questionNumber].answer4, for: .normal)

        }
        else {
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { UIAlertAction in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    //This method will check if the user has got the right answer.
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNumber].correctAnswer
        
        if correctAnswer == pickedAnswer {

            ProgressHUD.showSuccess("Correct!")
            
            score = score + 1
        }
        else {
            
            ProgressHUD.showError("Wrong!")
        }
    }
    
    //This method will wipe the board clean, so that users can retake the quiz.
    func startOver() {
       
        questionNumber = 0
        score = 0
        
        updateUI()
        
    }
    
    
}   // End of the class

