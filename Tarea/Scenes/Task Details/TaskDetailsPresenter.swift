//
//  TaskDetailsPresenter.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 19/02/2023.
//

import Foundation
import SQLite

protocol TaskDetailsProtocol: AnyObject {
    var presenter: TaskDetailsPresenter! { get set }
    func setTitle(_ taskTitle: String)
    func setDueTask(_ taskDueDate: Date)
}

typealias TaskDetailsDelegates = TaskDetailsProtocol & BaseViewControllerDelegates

final class TaskDetailsPresenter {
    
    private weak var view: TaskDetailsDelegates?
    
    private let router: TaskDetailsRouter
    
    private let sqliteServices: SQLiteManager<Task>
    
    private var task: Task
    
    private let indexPath: IndexPath

    private weak var delegates: TasksDelegation?
    
    init(_ view: TaskDetailsDelegates, router: TaskDetailsRouter, sqliteServices: SQLiteManager<Task>, task: Task, indexPath: IndexPath, delegates: TasksDelegation) {
        self.view = view
        self.router = router
        self.sqliteServices = sqliteServices
        self.task = task
        self.indexPath = indexPath
        self.delegates = delegates
    }
    
    func viewDidLoaded() {
        view?.setTitle(task.taskTitle)
        view?.setDueTask(task.dueDate)
    }
    
    func closeButtonClicked() {
        self.router.popView()
    }
    
    func markAsFinishedClicked() {
        task.isCompleted = true
        sqliteServices.update(task, filterQuery: Expression<String>("uuid") == task.uuid) { [weak self] updateResult in
            guard let self = self else { return }
            switch(updateResult) {
            case .success(_):
                self.delegates?.taskCompleted(self.indexPath)
                self.router.popView()
            case .failure(let baseError):
                debugPrint(baseError.localizedDescription)
                debugPrint(baseError)
                self.view?.showAlertView(alertMessage: baseError.localizedDescription)
            }
        }
    }
}
