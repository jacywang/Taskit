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
    var taskArray: [[String:String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let task1: [String:String] = ["task": "Study French", "subtask": "Verbs in past and current", "date": "02/01/2015"]
        let task2: [String:String] = ["task": "Eat dinner", "subtask": "Burger and salade", "date": "02/01/2015"]
        let task3: [String:String] = ["task": "Gym", "subtask": "Leg day", "date": "02/01/2015"]
        
        taskArray = [task1, task2, task3]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        println(indexPath.row)
        
        var taskDic: [String:String] = taskArray[indexPath.row]
        
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        cell.taskLabel.text = taskDic["task"]
        cell.descriptionLabel.text = taskDic["subtask"]
        cell.dateLabel.text = taskDic["date"]
        return cell
    }
    
    // UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    
    
    
}

