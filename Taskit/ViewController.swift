//
//  ViewController.swift
//  Taskit
//
//  Created by JIAN WANG on 2/16/15.
//  Copyright (c) 2015 JACY WANG. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var taskArray: [TaskModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let date1 = Date.from(year: 2015, month: 02, day: 01)
        let date2 = Date.from(year: 2015, month: 02, day: 02)
        let date3 = Date.from(year: 2015, month: 02, day: 03)
        
        let task1 = TaskModel(task: "Study French", subtask: "Verbs in past and present", date: date1)
        let task2 = TaskModel(task: "Eat Diner", subtask: "Burger and salade", date: date2)
        let task3 = TaskModel(task: "Gym", subtask: "Leg day", date: date3)
        
        taskArray = [task1, task2, task3]
        
        self.tableView.reloadData()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        taskArray = taskArray.sorted {
            (taskOne: TaskModel, taskTwo: TaskModel) -> Bool in
            return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
        }
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showTaskDetail" {
            let detailTaskVC: TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            let thisTask = taskArray[indexPath!.row]
            detailTaskVC.detailTaskModel = thisTask
            detailTaskVC.mainVC = self
        } else if segue.identifier == "showTaskAdd" {
            let addTaskVC: AddTaskViewController = segue.destinationViewController as AddTaskViewController
            addTaskVC.mainVC = self
        }
    }
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        performSegueWithIdentifier("showTaskAdd", sender: self)
    }
    
    
    // UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var thisTask = taskArray[indexPath.row]
        
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subtask
        cell.dateLabel.text = Date.toString(date: thisTask.date)
        return cell
    }
    
    // UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }
    
}

