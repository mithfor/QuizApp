//
//  QuestionViewController.swift
//  QuizApp
//
//  Created by Dmitrii Voronin on 16.08.2022.
//

import Foundation
import UIKit

class QuestionViewController: UIViewController {
    
    private var question: String = ""
    private var options: [String] = []
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    convenience init(question: String, options: [String] ) {
        self.init()
        self.question = question
        self.options = options
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        headerLabel.text = question
    }
}

extension QuestionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = UITableViewCell()
        cell.textLabel?.text = options[indexPath.row]
        return cell
    }
}
