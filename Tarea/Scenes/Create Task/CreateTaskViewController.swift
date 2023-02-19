//
//  CreateTaskViewController.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 18/02/2023.
//

import UIKit

final class CreateTaskViewController: BaseUIViewController, CreateTaskViewProtocol {
    
    var presenter: CreateTaskPresenter!
    
    private var keyboardManager: KeyboardManager? = nil
    
    private var taskTextFieldsView: TaskDetailsReusableView = {
        return TaskDetailsReusableView()
    }()
    
    private lazy var createButton: BaseUIButton = {
        let baseButton = BaseUIButton()
        baseButton.setTitle("Create")
        baseButton.addTarget(self, action: #selector(self.createButtonClicked(_:)), for: .touchUpInside)
        return baseButton
    }()
    
    private var bottomLayoutConstraint: NSLayoutConstraint? = nil
    
    override func loadView() {
        self.view = taskTextFieldsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTitle(.createTask)
        setupCreateButton()
        setupKeyboardManager()
    }
    
    private func setupCreateButton() {
        
        self.taskTextFieldsView.containerView.addSubview(createButton)
        let createButtonConstraints = [
            createButton.topAnchor.constraint(greaterThanOrEqualTo: taskTextFieldsView.viewBottomAnchor, constant: 15),
            createButton.bottomAnchor.constraint(equalTo: self.taskTextFieldsView.containerView.bottomAnchor, constant: -15),
            createButton.leadingAnchor.constraint(equalTo: self.taskTextFieldsView.containerView.leadingAnchor, constant: 15),
            createButton.trailingAnchor.constraint(equalTo: self.taskTextFieldsView.containerView.trailingAnchor, constant: -15)
        ]
        bottomLayoutConstraint = createButtonConstraints[1]
        NSLayoutConstraint.activate(createButtonConstraints)
    }
    
    private func setupKeyboardManager() {
        keyboardManager = KeyboardManager(view: self.view, self.bottomLayoutConstraint!)
    }
    
    @objc private func createButtonClicked(_ sender: BaseUIButton) {
        presenter.createButtonClicked()
    }

}

extension CreateTaskViewController {
    
    var taskTitle: String? {
        return self.taskTextFieldsView.titleTextField.text
    }
    
    var taskDueDate: Date {
        return self.taskTextFieldsView.dueDatePicker.date
    }
    
    var taskPriority: Int {
        return self.taskTextFieldsView.priorityPicker.selectedSegmentIndex
    }
}
