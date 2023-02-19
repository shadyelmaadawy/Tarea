//
//  TasksDelegates.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 19/02/2023.
//

import Foundation

protocol TasksViewProtocol: AnyObject {
    var presenter: TasksPresenter! { get set }
    func tasksIsReady()
    func insertRow(at indexPath: [IndexPath])
    func deleteRow(at indexPath: [IndexPath])
    func setCompleted(_ indexPath: IndexPath)

}

typealias TasksViewDelegates = TasksViewProtocol & BaseViewControllerDelegates

protocol TasksDelegation: AnyObject {
    func taskCreated(_ task: Task)
    func taskCompleted(_ indexPath: IndexPath)
}

