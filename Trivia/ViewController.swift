//
//  ViewController.swift
//  Trivia
//
//  Created by Xiao Lan on 10/9/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel?
    @IBOutlet var button1: UIButton?
    @IBOutlet var button2: UIButton?
    @IBOutlet var button3: UIButton?
    @IBOutlet var button4: UIButton?
    
    var triviaQuestions: [Question] = [
        Question(text: "What is the capital of France?", answers: ["Paris", "London", "Berlin", "Madrid"], correctAnswerIndex: 0),
        Question(text: "Which planet is known as the Red Planet?", answers: ["Earth", "Mars", "Venus", "Jupiter"], correctAnswerIndex: 1),
        Question(text: "What is the largest mammal in the world?", answers: ["Elephant", "Giraffe", "Blue Whale", "Hippopotamus"], correctAnswerIndex: 2),
    ]
    
    var currentQuestionIndex = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayQuestion()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        let selectedAnswerIndex = sender.tag
        let currentQuestion = triviaQuestions[currentQuestionIndex]
        
        if selectedAnswerIndex == currentQuestion.correctAnswerIndex {
            score += 1
        }
        
        currentQuestionIndex += 1
        
        if currentQuestionIndex < triviaQuestions.count {
            displayQuestion()
        } else {
            showEndOfGame()
        }
    }
    
    func displayQuestion() {
        let currentQuestion = triviaQuestions[currentQuestionIndex]
        
        questionLabel?.text = currentQuestion.text
        button1?.setTitle(currentQuestion.answers[0], for: .normal)
        button2?.setTitle(currentQuestion.answers[1], for: .normal)
        button3?.setTitle(currentQuestion.answers[2], for: .normal)
        button4?.setTitle(currentQuestion.answers[3], for: .normal)
    }
    
    func showEndOfGame() {
        questionLabel?.text = "Game Over! Your Score: \(score)"

        button1?.isHidden = true
        button2?.isHidden = true
        button3?.isHidden = true
        button4?.isHidden = true
    }
}
