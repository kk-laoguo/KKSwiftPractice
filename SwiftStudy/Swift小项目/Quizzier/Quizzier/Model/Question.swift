//
//  Question.swift
//  Quizzier
//
//  Created by zainguo on 2019/5/21.
//  Copyright © 2019 zainguo. All rights reserved.
//

import Foundation


class Question {
    
    let answer: Bool
    let questionText: String
    
    // 构造函数
    init(text: String, correctAnswer: Bool) {
        answer = correctAnswer
        questionText = text
    }
    
    
    
}

class People {
    let name: String
    let gender: String
    init(detailName: String, detailGender: String) {
        name = detailName
        gender = detailGender
    }
}
