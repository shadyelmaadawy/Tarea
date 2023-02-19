//
//  TasksRouter.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 19/02/2023.
//

import UIKit

final class TasksRouter {
    
    weak var viewController: UIViewController?
    
    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func pushCreateViewController(_ delegates: TasksDelegation) {
        let vc = CreateTaskViewConfigurator.createTaskVC(delegates)
        self.viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func pushDetailsViewController(_ task: Task, indexPath: IndexPath, delegates: TasksDelegation) {
        let vc = TaskDetailsConfigurator.createTaskDetailsVC(task, indexPath: indexPath, delegates: delegates)
        self.viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
}
