//
//  CreateTaskRouter.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 19/02/2023.
//

import UIKit

final class CreateTaskRouter {
    
    weak var view: UIViewController?
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func popView() {
        self.view?.navigationController?.popViewController(animated: true)
    }
    
}

