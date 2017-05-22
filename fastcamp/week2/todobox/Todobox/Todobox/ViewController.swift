//
//  ViewController.swift
//  Todobox
//
//  Created by hyeonju on 2017. 5. 22..
//  Copyright © 2017년 hyeonju. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    var tasks: [String] = [
        "청소하기",
        "빨래하기",
        "이슈 생성하기",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
}
