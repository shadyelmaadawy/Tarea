//
//  TasksPresenter.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 19/02/2023.
//

import Foundation
import SQLite

final class TasksPresenter: TasksDelegation {

    private weak var view: TasksViewDelegates?
    
    private let router: TasksRouter
    
    private let sqliteServices: SQLiteManager<Task>
    
    private var tasks: [Task] = {
        var baseTasks: [Task] = .init()
        baseTasks.reserveCapacity(46)
        return baseTasks
    }()
    
    var tasksCount: Int {
        return tasks.count
    }
    
    init(view: TasksViewDelegates, router: TasksRouter, sqliteServices: SQLiteManager<Task>) {
        self.view = view
        self.router = router
        self.sqliteServices = sqliteServices
    }
    
    func viewDidLoaded() {
        self.sqliteServices.read { [weak self] readResult in
            guard let self = self else { return }
            switch(readResult) {
                case .success(let tasks):
                    self.tasks.removeAll(keepingCapacity: true)
                    self.tasks.append(contentsOf: tasks)
                    self.view?.tasksIsReady()
                case .failure(let error):
                    self.view?.showAlertView(alertMessage: error.localizedDescription)
            }
        }
    }
    
    func createButtonClicked() {
        self.router.pushCreateViewController(self)
    }
    
    func taskCreated(_ task: Task) {
        let indexNumber = (self.tasks.count)
        self.tasks.append(task)
        self.view?.insertRow(at: [IndexPath(row: indexNumber, section: 0)])
    }
    
    func pushDetails(at indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        self.router.pushDetailsViewController(task, indexPath: indexPath, delegates: self)
    }
    
    func taskCompleted(_ indexPath: IndexPath) {
        self.view?.setCompleted(indexPath)
    }
    
    func deleteTask(at taskIndexPath: IndexPath) {
        let task = tasks[taskIndexPath.row]
        self.sqliteServices.delete(Expression<String>("uuid") == task.uuid) { [weak self] deleteResult in
            guard let self = self else { return }
            switch(deleteResult) {
                case .success(_):
                    self.tasks.remove(at: taskIndexPath.row)
                    self.view?.deleteRow(at: [taskIndexPath])
                case .failure(let error):
                    self.view?.showAlertView(alertMessage: error.localizedDescription)
            }
        }
    }
    
    func configureCell(cell: CellDelegates, at indexPath: IndexPath) {
        let entity = tasks[indexPath.row]
        cell.setTitle(entity.taskTitle)
        cell.setDueTime(entity.dueDate.fixDate())
        cell.setPriority(Priority.init(rawValue: entity.taskPriority)!)
        if(entity.isCompleted) {
            cell.disableCell()
        }
    }

}
