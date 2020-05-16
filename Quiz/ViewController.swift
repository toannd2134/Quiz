//
//  ViewController.swift
//  Quiz
//
//  Created by Toan on 5/14/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var TimeView: UIView!
    @IBOutlet weak var TexViewQuestion: UITextView!
    
   
    @IBOutlet weak var image: UIImageView!
    
    var isCorect : Bool!
    var numberOfCorectAnwser = 0
    
    @IBOutlet var anwserChoice: [UIButton]!
    
   var curentQuestion = 0
    var groupQuiz = [Question]()
    override func viewDidLoad() {
        super.viewDidLoad()
      addQuestion()
        setup()
     
        
    }

    func addQuestion(){
       
        let quiz1 = Question(image: nil, question: "asdas", CorectAnser: 1, anwser: ["sad","asds","asda","sadas"])
        groupQuiz.append(quiz1)
        let quiz2 = Question(image: nil, question: "sad", CorectAnser: 1, anwser: ["asd","sdas","sad","asds"])
        groupQuiz.append(quiz2)
        
    }
    func setup(){
           TimeView.layer.cornerRadius = 20
           TexViewQuestion.isEditable = false
        
           performQuestion()
        
        
    }
    func performQuestion(){
        if curentQuestion < groupQuiz.count{
        TexViewQuestion.text = groupQuiz[curentQuestion].question
                   image.image = groupQuiz[curentQuestion].image
                   for j in 0...groupQuiz[curentQuestion].anwser.count - 1  {
                       
                           anwserChoice[j].setTitle(groupQuiz[curentQuestion].anwser[j], for: .normal)
                          
                       
                   }
    }
    }
 
    
    @IBAction func anwserChoice(_ sender: UIButton) {
        if  curentQuestion < groupQuiz.count - 1{
            if sender.tag == groupQuiz[curentQuestion].corectAnwser {
                for i in self.anwserChoice {
                    if i.tag == sender.tag {
                        let _ = UIView.animate(withDuration: 0.5, animations: {
                            
                            i.backgroundColor = .red
                            self.numberOfCorectAnwser += 1
                            
                            print(self.numberOfCorectAnwser)
                            
                        }) { (_) in
                            
                            self.curentQuestion += 1
                            self.performQuestion()
                            i.backgroundColor = .white
                            
                            
                        }
                    }}
                
                
                
                
            }
        }else{
            let vc = ResurtViewController()
            vc.modalPresentationStyle = .fullScreen
            curentQuestion = 0
            performQuestion()
            self.present(vc, animated: true, completion: nil)
        }
        
    }
    
}
