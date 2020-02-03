//
//  QuestionBank.swift
//  Quizzler
//
//  Created by Angela Yu on 26/08/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import Foundation
enum correctAnswer:String {
    case answer1
    case answer2
    case answer3
    case answer4

}
class QuestionBank {
    
    var list = [Question]()
    
    init() {
        // Creating a quiz item and appending it to the list
        list.append(Question(questionText: "2 + 2 = ?", answer1: "2", answer2: "4", answer3: "6", answer4: "8", correctAnswer: "4"))
        list.append(Question(questionText: "2 + 4 = ?", answer1: "2", answer2: "4", answer3: "6", answer4: "8", correctAnswer: "6"))
        
     
        
        
        
        
    }
    
}


