//
//  TaskDetailsConfigurator.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 19/02/2023.
//

import UIKit

final class TaskDetailsConfigurator {
    
    class func createTaskDetailsVC(_ task: Task, indexPath: IndexPath, delegates: TasksDelegation) -> UIViewController {
        let taskDetailsVC = TaskDetailsViewController()
        let router = TaskDetailsRouter(taskDetailsVC)
        let sqliteServices = SQLiteManager<Task>(TasksTable())
        let presenter = TaskDetailsPresenter(taskDetailsVC, router: router, sqliteServices: sqliteServices, task: task, indexPath: indexPath, delegates: delegates)
        taskDetailsVC.presenter = presenter
        return taskDetailsVC
    }
}
