//
//  TaskDetailsRouter.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 19/02/2023.
//

import UIKit

final class TaskDetailsRouter {
    
    weak var viewController: UIViewController?
    
    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func popView() {
        self.viewController?.navigationController?.popViewController(animated: true)
    }
    
}
