//
//  PunchlineViewController.swift
//  TriviaQuestions
//
//  Created by Ethan Chang on 2/28/19.
//  Copyright © 2019 SomeAweApps. All rights reserved.
//

import UIKit

class PunchlineViewController: UIViewController {
    @IBOutlet weak var punchlineLabel: UILabel!
    var punchline = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        punchlineLabel.text = punchline
        // Do any additional setup after loading the view.
    }
    


}
