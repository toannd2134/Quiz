//
//  Question.swift
//  Quiz
//
//  Created by Toan on 5/14/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import Foundation
import UIKit
struct Question {
    var question  : String
    
    var anwser : [String]
//    var corectAnwser : [Int]
    var corectAnwser : Int
    var image : UIImage?
 
    init( image : UIImage? , question : String , CorectAnser : Int ,anwser : [String] ) {
        self.question = question
        self.corectAnwser = CorectAnser
        self.anwser = anwser
        self.image = image
        
    }
}
