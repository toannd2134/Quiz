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
    
    
    @IBOutlet weak var ChoiceCategory: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        ChoiceCategory.dataSource = self
        ChoiceCategory.delegate = self
        ChoiceCategory.bounces = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    func setup(){
        let catgory1 = category(id: 1, categoryName: "Lịch sử", question: question1())
        let catgory2 = category(id: 2, categoryName: "Tổng Hợp", question: question2())
        // Do any additional setup after loading the view.
        Bigcategor.append(catgory1)
        Bigcategor.append(catgory2)
        
        
        
    }
 
}
extension FirstViewController : UITableViewDelegate ,UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return Bigcategor.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as! cellTableViewCell
        
        cell.nameCatgory.text = Bigcategor[indexPath.row].catgoryName
        
      
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for i in 0...Bigcategor.count {
            if  indexPath.row == i {
                let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
                let vc = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                vc.groupQuiz = Bigcategor[i].question
                let navigation = UINavigationController(rootViewController: vc)
                navigation.modalPresentationStyle = .fullScreen
                self.present(navigation, animated: true, completion: nil)
            }
        }
        
     
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



