//
//  ExerciseViewController.swift
//  Lose It!
//
//  Created by Abeer Nasir on 09/09/2021.
//

import UIKit

class ExerciseViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    let quiz = ["Have you tried weight loss before?",
                "Do you workout?",
                "Do you follow a diet plan?",
                "Will tracking calories help you control your diet?",
                "Have you counted calories before?",
                "Do you find yourself obsessing over unhealthy food?"]
    
    var questionNumber = 0
   
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func answerButtonPressed(_ sender: Any) {
        if questionNumber+1 < quiz.count{
            
        questionNumber+=1
        updateUI()
       
        }
        }
       
    
    
    func updateUI(){
        questionLabel.text = quiz[questionNumber]
    }

}
