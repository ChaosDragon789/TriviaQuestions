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
        
        
        if let url = URL(string: query) {
            if let data = try? Data(contentsOf: url) {
                let json = try! JSON(data: data)
                if json["response_code"] == 0 {
                    parse(json: json)
                    return
                }
            }
        }
        loadError()
    }
    
    func parse(json: JSON) {
        for query in json["results"].arrayValue {
            let category = query["category"].stringValue
            let question = query["question"].stringValue
            let correct = query["correct_answer"].stringValue
            let incorrect = query["incorrect_answer"].arrayValue
            let incorrectOne = incorrect[0].stringValue
            let incorrectTwo = incorrect[1].stringValue
            let incorrectThree = incorrect[2].stringValue
            
            
            let temp = ["category": category, "question": question, "correct": correct, "incorrectOne": incorrectOne,"incorrectTwo":incorrectTwo,"incorrectThree":incorrectThree]
            questions.append(temp)
        }
        tableView.reloadData()
    }
    
    func loadError() {
        let alert = UIAlertController(title: "Loading Error",
                                      message: "There was a problem loading the random questions",
                                      preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil) }
    

}

