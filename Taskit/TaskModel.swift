//
//  TaskModel.swift
//  Taskit
//
//  Created by JIAN WANG on 3/2/15.
//  Copyright (c) 2015 JACY WANG. All rights reserved.
//

import Foundation
import CoreData

@objc(TaskModel)
class TaskModel: NSManagedObject {

    @NSManaged var task: String
    @NSManaged var subtask: String
    @NSManaged var date: NSDate
    @NSManaged var completed: NSNumber

}
