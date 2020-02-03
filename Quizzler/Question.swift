//
//  Question.swift
//  Quizzler
//
//  Created by Angela Yu on 26/08/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    
    let questionText : String
    let answer1 : String
    let answer2 : String
    let answer3 : String
    let answer4 : String
    let correctAnswer : String
    

    init(questionText : String, answer1 : String, answer2 : String, answer3 : String, answer4 : String, correctAnswer : String) {
        self.questionText = questionText
        self.answer1 = answer1
        self.answer2 = answer2
        self.answer3 = answer3
        self.answer4 = answer4
        self.correctAnswer = correctAnswer
    }
    
}

