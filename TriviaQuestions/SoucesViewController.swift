//
//  ViewController.swift
//  TriviaQuestions
//
//  Created by Ethan Chang on 2/25/19.
//  Copyright © 2019 SomeAweApps. All rights reserved.
//

import UIKit

 class SourcesViewController: UITableViewController{
    var questions = [[String: String]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Trivia Questions"
        let query = "https://opentdb.com/api.php?amount=50&difficulty=medium&type=multiple"
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

