//
//  CreateTaskViewConfigurator.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 19/02/2023.
//

import UIKit

final class CreateTaskViewConfigurator {
    
    class func createTaskVC(_ delegates: TasksDelegation) -> UIViewController {
        let createTask = CreateTaskViewController()
        let router = CreateTaskRouter(view: createTask)
        let sqliteServices = SQLiteManager<Task>(TasksTable())
        createTask.presenter = CreateTaskPresenter(view: createTask, router: router, delegates: delegates, sqliteServices: sqliteServices)
        return createTask
    }
    
}
