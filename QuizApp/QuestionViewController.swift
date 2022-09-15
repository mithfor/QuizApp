//
//  QuestionViewController.swift
//  QuizApp
//
//  Created by Dmitrii Voronin on 16.08.2022.
//

import Foundation
import UIKit

class QuestionViewController: UIViewController {
    
    private var question = ""
    private var options = [String]()
    private var selection: ((String) -> Void)? = nil
    private let reuseIdentifier = "Cell"
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    convenience init(question: String, options: [String], selection: @escaping (String) -> Void ) {
        self.init()
        self.question = question
        self.options = options
        self.selection = selection
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        headerLabel.text = question
    }
    
    private func dequeueCell(in tableView: UITableView) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) {
            return cell
        }
        return UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
    }
}

extension QuestionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = dequeueCell(in: tableView)
        cell.textLabel?.text = options[indexPath.row]
        return cell
    }
}
extension QuestionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        selection?(options[indexPath.row])
     }
}
