//
//  TasksViewController+Delegates.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 19/02/2023.
//

import UIKit

extension TasksViewController {
    
    func tasksIsReady() {
        self.tasksTableView.reloadData()
    }
    
    func insertRow(at indexPath: [IndexPath]) {
        self.tasksTableView.insertRows(at: indexPath, with: .automatic)
    }
    
    func deleteRow(at indexPath: [IndexPath]) {
        self.tasksTableView.deleteRows(at: indexPath, with: .fade)
    }
    

    func setCompleted(_ indexPath: IndexPath) {
        guard let taskCell = self.tasksTableView.cellForRow(at: indexPath) as? CellDelegates else { return }
        taskCell.disableCell()
    }
    
}
