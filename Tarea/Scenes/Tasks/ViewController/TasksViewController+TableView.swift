//
//  TasksViewController+TableView.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 19/02/2023.
//

import UIKit

extension TasksViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let taskCell = tableView.dequeue() as TaskTableViewCell
        presenter.configureCell(cell: taskCell, at: indexPath)
        return taskCell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: nil) { [ weak self ] _, _, completionHandler in
            guard let self = self else { return }
            self.showConfirmationView(alertMessage: "deleting an entity is definitive, no way to restore it, are you sure?") { [weak self] actionResult in
                guard let self = self else { return }
                if(actionResult == true) {
                    self.presenter.deleteTask(at: indexPath)
                }
                completionHandler(actionResult)
            }
        }
        deleteAction.image = .createBaseImage(.delete, color: .red)
        return UISwipeActionsConfiguration(actions: [
            deleteAction
        ])
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let tableView = tableView as? BaseUITableView else { return self.presenter.tasksCount }
        let tasksCount = self.presenter.tasksCount
        if(tasksCount == 0) {
            tableView.showEmptyMessageLabel()
        } else {
            tableView.hideEmptyMessageLabel()
        }
        return tasksCount
    }
        
}

extension TasksViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.presenter.pushDetails(at: indexPath)
    }
    
}

