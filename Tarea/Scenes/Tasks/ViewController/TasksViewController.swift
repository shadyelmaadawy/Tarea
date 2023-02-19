//
//  TasksViewController.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 18/02/2023.
//

import UIKit

final class TasksViewController: BaseUIViewController, TasksViewProtocol {
    
    var presenter: TasksPresenter! {
        didSet {
            self.presenter.viewDidLoaded()
        }
    }
    
    private lazy var createTaskButton: BaseCircleUIButton = {
        let baseButton = BaseCircleUIButton()
        baseButton.setImage(.add)
        baseButton.addTarget(self, action: #selector(createButtonClicked(_:)), for: .touchUpInside)
        return baseButton
    }()
    
    private(set) lazy var tasksTableView: BaseUITableView = {
        let baseTableView = BaseUITableView()
        baseTableView.setDelegates(self)
        baseTableView.setDataSource(self)
        baseTableView.register(TaskTableViewCell.self)
        return baseTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutView()
    }
    
    private func layoutView() {
        setupTasksTableView()
        setupCreateButton()
    }
    
    private func setupTasksTableView() {
        
        self.view.addSubview(tasksTableView)
        let tasksTableViewConstraints = [
            tasksTableView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            tasksTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -5),
            tasksTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 17.5),
            tasksTableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -17.5)
        ]
        NSLayoutConstraint.activate(tasksTableViewConstraints)
        
    }
    
    private func setupCreateButton() {
     
        self.view.addSubview(createTaskButton)
        let createTaskButtonConstraints = [
            createTaskButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -15),
            createTaskButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -15),
        ]
        NSLayoutConstraint.activate(createTaskButtonConstraints)
        
    }
    
    @objc private func createButtonClicked(_ sender: BaseCircleUIButton) {
        presenter.createButtonClicked()
    }
    
}

