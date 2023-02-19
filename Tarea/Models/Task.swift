//
//  Task.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 19/02/2023.
//

import Foundation

enum Priority: Int, Codable {
    case high = 2
    case medium = 1
    case low = 0
}

final class Task: Codable {
    
    let uuid: String
    var taskTitle: String
    var dueDate: Date
    var taskPriority: Int
    var isCompleted: Bool
    
    enum CodingKeys: String, CodingKey {
        case uuid
        case taskTitle = "task_title"
        case dueDate = "due_date"
        case taskPriority = "task_priority"
        case isCompleted = "task_completed"
    }
    
    init(uuid: String, taskTitle: String, dueDate: Date, taskPriority: Priority, isCompleted: Bool) {
        self.uuid = uuid
        self.taskTitle = taskTitle
        self.dueDate = dueDate
        self.taskPriority = taskPriority.rawValue
        self.isCompleted = isCompleted
    }
    
}
