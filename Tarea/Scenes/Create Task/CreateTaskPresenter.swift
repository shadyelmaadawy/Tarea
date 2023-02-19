//
//  CreateTaskPresenter.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 19/02/2023.
//

import Foundation

final class CreateTaskPresenter {
    
    private let router: CreateTaskRouter
    
    private weak var view: CreateTaskViewDelegates?

    private weak var delegates: TasksDelegation?
    
    private let sqliteServices: SQLiteManager<Task>

    
    init(view: CreateTaskViewDelegates, router: CreateTaskRouter ,delegates: TasksDelegation, sqliteServices: SQLiteManager<Task>) {
        self.view = view
        self.router = router
        self.delegates = delegates
        self.sqliteServices = sqliteServices
    }
    
    func createButtonClicked() {
        guard let view = view else { return }
        guard let taskTitle = view.taskTitle, taskTitle.count > 0 else {
            view.showAlertView(alertMessage: "You must write a title for task.")
            return
        }
        let createdTask = Task.init(
            uuid: UUID().uuidString, taskTitle: taskTitle, dueDate: view.taskDueDate,
            taskPriority: Priority.init(rawValue: view.taskPriority)!, isCompleted: false
        )
        sqliteServices.create(createdTask) { [weak self] createResult in
            guard let self = self else { return }
            switch(createResult) {
                case .success(let createdTask):
                    self.delegates?.taskCreated(createdTask)
                    self.router.popView()
                case .failure(let error):
                    self.view?.showAlertView(alertMessage: error.localizedDescription)
            }
        }
    }
    
}
