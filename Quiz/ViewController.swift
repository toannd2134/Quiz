//
//  ViewController.swift
//  Quiz
//
//  Created by Toan on 5/14/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var valueTime  : Timer!
    @IBOutlet weak var time: UIProgressView!
    @IBOutlet weak var TexViewQuestion: UITextView!
    @IBOutlet weak var image: UIImageView!
    var isCorect : Bool!
    var numberOfCorectAnwser = 0
      let maximumTime = 20
    var progess = Float()
    @IBOutlet var anwserChoice: [UIButton]!
    var CurrentTime  : Float = 0
    var curentQuestion = 0
    var groupQuiz = [Question]()
    var audioPlayer :AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        addQuestion()
        setup()
        
        performQuestion()
        timer()
       
    }
    
    func addQuestion(){
        let vc = FirstViewController()
        vc.passData = { [weak self] data in
            guard let main = self else {
                return
            }
            main.groupQuiz = data
            
        }
        
    }
    func setup(){
        let bacbutton = UIButton(type: .system )
        bacbutton.setTitle("back", for: .normal)
        bacbutton.addTarget(self, action: #selector(backButton1), for: .allEvents)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: bacbutton)
        TexViewQuestion.isEditable = false
        performQuestion()
        for i in anwserChoice {
            i.layer.cornerRadius = 20
        }
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
    }
    @objc func backButton1(){
        self.dismiss(animated: true, completion: nil)
    }
    func timer(){
    time.progress = 0
        valueTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeRun), userInfo: nil, repeats: true)
       
        
        
    }
    @objc func timeRun(){

//        time.setProgress(10, animated: true)
//        print(time.progress)
        
        if  time.progress < 1 {
            time.progress += 0.1
            
            
        }else{
            if curentQuestion < 10 {
            curentQuestion += 1
            performQuestion()
            
            }else{
                
                valueTime.invalidate()
                let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
                 let vc1 = mainStoryboard.instantiateViewController(withIdentifier: "ViewController2") as! ResurtViewController
                vc1.resurt = numberOfCorectAnwser
                  
                 let navigation = UINavigationController(rootViewController: vc1)
                 navigation.modalPresentationStyle = .fullScreen
                 self.present(navigation, animated: true, completion: nil)
              
                
               
            }
            
        }
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
                            self.performQuestion()
                            self.time.progress = 0
                            let pathToSound = Bundle.main.path(forResource: "corect", ofType: "mp3")!
                            let url = URL(fileURLWithPath: pathToSound)
                            do {
                                self.audioPlayer = try AVAudioPlayer(contentsOf: url)
                                self.audioPlayer?.play()
                            }catch{
                                
                            }
                             print(self.numberOfCorectAnwser)
                        }) { (_) in
                            let  _  = UIView.animate(withDuration: 0.5 ) {
                                i.backgroundColor = .white
                                self.curentQuestion += 1
                                self.performQuestion()
                                self.time.progress = 0
                                
                                   
                                   
                                    
                                
                            }
                            
                        
                        }
                    }
                }
            }else{
                let _  = UIView.animate(withDuration: 0.3, animations: {
                    let pathToSound = Bundle.main.path(forResource: "incorrect", ofType: "mp3")!
                    let url = URL(fileURLWithPath: pathToSound)
                    do {
                        self.audioPlayer = try AVAudioPlayer(contentsOf: url)
                        self.audioPlayer?.play()
                    }catch{
                        
                    }
                }) { (_) in
                 
                }
                    self.time.progress = 0
                    self.curentQuestion += 1
                    self.performQuestion()
               
                
             
            }
        }else{
            let vc = ResurtViewController()
            vc.modalPresentationStyle = .fullScreen
           
            performQuestion()
            let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
            let vc1 = mainStoryboard.instantiateViewController(withIdentifier: "ViewController2") as! ResurtViewController
            vc1.resurt = numberOfCorectAnwser
           
            let navigation = UINavigationController(rootViewController: vc1)
            navigation.modalPresentationStyle = .fullScreen
            self.present(navigation, animated: true, completion: nil)
           
           
            time.setProgress(10, animated: true)
        }
        
    }
    
}
