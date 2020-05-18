//
//  resurtViewController.swift
//  Quiz
//
//  Created by Toan on 5/16/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit

class ResurtViewController: UIViewController {
   
     
    var resurt : Int!
    @IBOutlet weak var resurtlabel: UILabel!
   
    @IBOutlet var button: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in button{
        i.layer.cornerRadius = 20
    }
        resurtlabel.text = "kết quả của bạn. là \(resurt!)/10"
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    
    
    @IBAction func reDo(_ sender: Any) {
       
        dismiss(animated: true, completion: nil)
        
        
    }
    
    @IBAction func popHOme(_ sender: Any) {
        
        
    }
    
}
