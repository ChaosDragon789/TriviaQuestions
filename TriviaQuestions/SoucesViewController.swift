//
//  ViewController.swift
//  TriviaQuestions
//
//  Created by Ethan Chang on 2/25/19.
//  Copyright © 2019 SomeAweApps. All rights reserved.
//

import UIKit

 class SourcesViewController: UITableViewController{
    var jokes = [[String: String]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Random Jokes"
        let query = "https://official-joke-api.appspot.com/random_ten"
        DispatchQueue.global(qos: .userInitiated).async {
            [unowned self] in
            
        
        if let url = URL(string: query) {
            if let data = try? Data(contentsOf: url) {
                let json = try! JSON(data: data)
                
                    self.parse(json: json)
                    return
                
            }
        }
        self.loadError()
        }
    }
    
    func parse(json: JSON) {
        for query in json.arrayValue {
            let type = query["type"].stringValue
            let setup = query["setup"].stringValue
            let punchline = query["punchline"].stringValue
            
            let temp = ["type":type,"setup":setup,"punchline":punchline]
            jokes.append(temp)
        }
        DispatchQueue.main.async {
            [unowned self] in
            self.tableView.reloadData()
        }
    }
    
    func loadError() {
        DispatchQueue.main.async {
            [unowned self] in
           
        let alert = UIAlertController(title: "Loading Error",
                                      message: "There was a problem loading the jokes",
                                      preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let source = jokes[indexPath.row]
        cell.textLabel?.text = source["type"]
        cell.detailTextLabel?.text = source["setup"]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! PunchlineViewController
        let index = tableView.indexPathForSelectedRow?.row
        let joke = jokes[index!]
        dvc.punchline = joke["punchline"]!
        
    }
    
}



