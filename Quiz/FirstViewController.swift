//
//  FirstViewController.swift
//  Quiz
//
//  Created by Toan on 5/15/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    var  Bigcategor = [category]()
    var passData : (([Question]) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    func setup(){
        let catgory1 = category(id: 1, categoryName: "Lịch sử", question: question1())
        let catgory2 = category(id: 2, categoryName: "Tổng Hợp", question: question2())
        // Do any additional setup after loading the view.
        Bigcategor.append(catgory1)
        Bigcategor.append(catgory2)
        
    }
    
    @IBAction func present(_ sender: UIButton) {
           
        
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        for i in Bigcategor{
            if i.catgoryName == sender.currentTitle{
                vc.groupQuiz = i.question
            }
        }
        let navigation = UINavigationController(rootViewController: vc)
        navigation.modalPresentationStyle = .fullScreen
        self.present(navigation, animated: true, completion: nil)
        
        
        
        
        
    }
    
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


