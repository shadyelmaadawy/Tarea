//
//  TasksViewConfigurator.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 19/02/2023.
//

import UIKit

final class TasksViewConfigurator {
    
    class func createTasksVC() -> UIViewController {
        let tasksViewController = TasksViewController()
        let sqliteManager = SQLiteManager<Task>(TasksTable())
        let router = TasksRouter(tasksViewController)
        let presenter = TasksPresenter(view: tasksViewController, router: router, sqliteServices: sqliteManager)
        tasksViewController.presenter = presenter
        tasksViewController.setTitle(.tasks)
        return tasksViewController
    }
}
