//
//  CreateTaskViewDelegates.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 19/02/2023.
//

import Foundation

protocol CreateTaskViewProtocol: AnyObject {
    var presenter: CreateTaskPresenter! { get set }
    var taskTitle: String? { get }
    var taskDueDate: Date { get }
    var taskPriority: Int { get }
}

typealias CreateTaskViewDelegates = CreateTaskViewProtocol & BaseViewControllerDelegates
