//
//  ViewController.swift
//  Todobox
//
//  Created by hyeonju on 2017. 5. 22..
//  Copyright © 2017년 hyeonju. All rights reserved.
//

import UIKit

class TaskListViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    var tasks: [Task] = [
        Task(title:"청소하기", isDone:false),
        Task(title:"빨래하기", isDone:true),
        Task(title:"이슈 생성하기", isDone:false),
    ]
    
    // MARK: View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let nav = segue.destination as? UINavigationController {
      if let vc = nav.viewControllers.first as? TaskEditViewController {
        vc.didAddTask = { [weak self] task in
          self?.tasks.append(task)
          self?.tableView.reloadData()
        }
      }
      
    }
  
  }
    
}


// MARK: - UITableViewDataSource
extension TaskListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.title
        cell.textLabel?.text = task.title
        if task.isDone{
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
}


// MARK: - UITableViewDelegate
extension TaskListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let oldTask = self.tasks[indexPath.row]
        let newTask = Task(title: oldTask.title, isDone: !oldTask.isDone)
        
    
        self.tasks[indexPath.row] = newTask
        tableView.reloadRows(at: [indexPath], with: .automatic)// anmation 이 실행되며 선택된 row를 새로고침
        //tableView.reloadData()// 냅따 전체 새로 고침 성능차이는 위에꺼와 별반 다를바 없다니..놀라움
        
    }
    
}
