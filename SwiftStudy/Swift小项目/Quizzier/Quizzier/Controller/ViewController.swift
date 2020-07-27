//
//  ViewController.swift
//  Quizzier
//
//  Created by zainguo on 2019/5/21.
//  Copyright © 2019 zainguo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let questions = [
        Question(text: "马云是中国首富", correctAnswer: true),
        Question(text: "刘强东最早是在中关村卖光盘的", correctAnswer: true),
        Question(text: "苹果公司是目前世界上最牛的科技公司", correctAnswer: true),
        Question(text: "只要坚持下去就能学好代码吗", correctAnswer: true),
        Question(text: "王思聪是80后", correctAnswer: true),
        Question(text: "在国内可以正常访问google.com吗", correctAnswer: false),
        Question(text: "敲完1万行代码之后可以成为编程高手吗", correctAnswer: true),
        Question(text: "撒贝宁说过清华还行吗", correctAnswer: false),
        Question(text: "一直听复昕学堂lebus的课可以变成大牛吗", correctAnswer: true),
        Question(text: "网上说苹果不好用安卓好用的人大多数都是水军吗", correctAnswer: true),
        Question(text: "豆瓣网是一个和你分享刚编的故事的网站吗", correctAnswer: false),
        Question(text: "优酷比B站牛", correctAnswer: false),
        Question(text: "我帅吗？", correctAnswer: true)
    ]
    
    var questionNum = 0
    var score = 0
    
    
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[questionNum].questionText
        
        
    }
    
    
    @IBAction func answerPressed(_ sender: UIButton) {
        
        
        checkAnswer(tag: sender.tag)
        questionNum += 1
        nextQuestion()
        progressLabel.text = "\(questionNum + 1)/13"
        progressBar.frame.size.width = (view.frame.width / 13) * CGFloat(questionNum + 1)
        
    }
    
    func checkAnswer(tag: Int) {
        
        if tag == 1 {
            
            if questions[questionNum].answer == true {
                score += 1
                scoreLabel.text = "总得分: \(score)"
                ProgressHUD.showSuccess("答对了")
            } else {
                ProgressHUD.showError("答错啦")
            }
        } else {
            if questions[questionNum].answer != true {
                score += 1
                scoreLabel.text = "总得分: \(score)"
                ProgressHUD.showSuccess("答对了")

            } else {
                ProgressHUD.showError("答错啦")

            }
        }
        
    }
    
    func nextQuestion() {
        
        if questionNum <= 12 {
            questionLabel.text = questions[questionNum].questionText
        } else {
            
            questionNum = 0
            score = 0
            
            let alert = UIAlertController(title: "漂亮!", message: "您已经完成所有问题, 需要重新来一遍吗? ", preferredStyle: .alert)
            let action = UIAlertAction(title: "再来一遍", style: .default) { (_) in
                
                self.questionLabel.text = self.questions[self.questionNum].self.questionText
                self.scoreLabel.text = "总得分: \(self.score)"
                self.progressBar.frame.size.width = self.view.frame.width / 13

            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    }
    

}

