//
//  Question.swift
//  Quiz App
//
//  Created by See Sight Tours on 23/04/2024.
//

import Foundation
struct Question {
    
    let text: String
    let answer : String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
