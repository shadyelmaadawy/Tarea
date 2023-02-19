//
//  TaskDetailsViewController.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 19/02/2023.
//

import UIKit

final class TaskDetailsViewController: BaseUIViewController, TaskDetailsProtocol {

    var presenter: TaskDetailsPresenter! {
        didSet {
            presenter.viewDidLoaded()
        }
    }
    
    private var taskTextFieldsView: TaskDetailsReusableView = {
        return TaskDetailsReusableView(false)
    }()
    
    private lazy var closeButton: BaseUIButton = {
        let baseButton = BaseUIButton()
        baseButton.setTitle("Close")
        baseButton.setColors(.systemGray6, textColor: .label)
        baseButton.setBorder(.label)
        baseButton.addTarget(self, action: #selector(closeButtonClicked(_:)), for: .touchUpInside)
        return baseButton
    }()
    
    private lazy var markAsFinished: BaseUIButton = {
        let baseButton = BaseUIButton()
        baseButton.setTitle("Mark as finished")
        baseButton.addTarget(self, action: #selector(markAsFinishedClicked(_:)), for: .touchUpInside)
        return baseButton
    }()
    
    private lazy var buttonsStackView: BaseUIStackView = {
        let baseStackView = BaseUIStackView()
        baseStackView.spacing = 10.00
        baseStackView.addArrangedSubview(closeButton)
        baseStackView.addArrangedSubview(markAsFinished)
        return baseStackView
    }()
        
    override func loadView() {
        self.view = taskTextFieldsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonsStackView()
    }
    
    private func setupButtonsStackView() {

        self.taskTextFieldsView.containerView.addSubview(buttonsStackView)
        let buttonsStackViewConstraints = [
            buttonsStackView.topAnchor.constraint(greaterThanOrEqualTo: self.taskTextFieldsView.viewBottomAnchor, constant: 15),
            buttonsStackView.bottomAnchor.constraint(equalTo: self.taskTextFieldsView.containerView.bottomAnchor, constant: -15),
            buttonsStackView.leadingAnchor.constraint(equalTo: self.taskTextFieldsView.containerView.leadingAnchor, constant: 15),
            buttonsStackView.trailingAnchor.constraint(equalTo: self.taskTextFieldsView.containerView.trailingAnchor, constant: -15)
        ]
        NSLayoutConstraint.activate(buttonsStackViewConstraints)
        
    }
    
    @objc private func closeButtonClicked(_ sender: BaseUIButton) {
        presenter.closeButtonClicked()
    }
    
    @objc private func markAsFinishedClicked(_ sender: BaseUIButton) {
        presenter.markAsFinishedClicked()
    }
    
    func setTitle(_ taskTitle: String) {
        self.taskTextFieldsView.titleTextField.text = taskTitle
    }
    
    func setDueTask(_ taskDueDate: Date) {
        self.taskTextFieldsView.dueDatePicker.date = taskDueDate
    }

    
}
