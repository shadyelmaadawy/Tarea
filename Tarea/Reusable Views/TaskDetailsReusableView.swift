//
//  TaskDetailsReusableView.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 18/02/2023.
//

import UIKit

final class TaskDetailsReusableView: BaseUIView, UITextFieldDelegate {
    
    var viewBottomAnchor: NSLayoutYAxisAnchor {
        return titleTextField.bottomAnchor
    }
    
    private var scrollView: BaseUIScrollView = {
        return BaseUIScrollView()
    }()
    
    private(set) var containerView: BaseUIView = {
        return BaseUIView()
    }()
    
    private var keyboardManager: KeyboardManager? = nil
    
    private(set) lazy var titleTextField: BaseUITextField = {
        let baseTextField = BaseUITextField()
        baseTextField.delegate = self
        baseTextField.setPlaceHolder("Title")
        return baseTextField
    }()
    
    private var dateLabel: BaseUILabel = {
        let baseLabel = BaseUILabel()
        baseLabel.text = "Due Date:"
        return baseLabel
    }()
    
    private(set) lazy var dueDatePicker: BaseUIDatePicker = {
        let baseDatePicker = BaseUIDatePicker()
        return baseDatePicker
    }()

    private(set) lazy var priorityPicker: BaseUISegmentedControl = {
        let baseSegmentControl = BaseUISegmentedControl(
            items: ["Low", "Medium", "High"]
        )
        return baseSegmentControl
    }()
    
    
    init(_ enabled: Bool = true) {
        super.init()
        self.setupView()
        self.layoutView()
        self.enableTextFields(enabled)
    }
    
    private func setupView() {
        self.enableAutoResizingMask()
    }
    
    private func layoutView() {
        setupScrollView()
        setupContainerView()
        setupTitleTextField()
        setupDateLabel()
        setupDatePicker()
        setupPriorityPicker()
    }
    
    private func enableTextFields(_ enabled: Bool) {
        titleTextField.isEnabled = enabled
        dueDatePicker.isEnabled = enabled
        priorityPicker.isEnabled = enabled
    }
    
    private func setupScrollView() {
    
        self.addSubview(scrollView)
        let scrollViewConstraints = [
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        ]
        NSLayoutConstraint.activate(scrollViewConstraints)
    }
    
    private func setupContainerView() {
        
        self.scrollView.addSubview(containerView)
        let containerViewConstraints = [
            containerView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            containerView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            containerView.heightAnchor.constraint(greaterThanOrEqualTo: self.scrollView.heightAnchor)
        ]
        NSLayoutConstraint.activate(containerViewConstraints)
        
    }
    
    private func setupTitleTextField() {
        
        self.containerView.addSubview(titleTextField)
        let titleTextFieldConstraints = [
            titleTextField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15),
            titleTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            titleTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15)
        ]
        NSLayoutConstraint.activate(titleTextFieldConstraints)
    }
    
    private func setupDateLabel() {
        
        self.containerView.addSubview(dateLabel)
        let dateLabelConstrains = [
            dateLabel.topAnchor.constraint(equalTo: self.titleTextField.bottomAnchor, constant: 15),
            dateLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20)
        ]
        NSLayoutConstraint.activate(dateLabelConstrains)
    }
    
    private func setupDatePicker() {
        
        self.containerView.addSubview(dueDatePicker)
        let datePickerConstraints = [
            dueDatePicker.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor),
            dueDatePicker.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15)
        ]
        NSLayoutConstraint.activate(datePickerConstraints)
        
    }
    
    private func setupPriorityPicker() {
        
        self.containerView.addSubview(priorityPicker)
        let priorityPickerConstraints = [
            priorityPicker.topAnchor.constraint(equalTo: dueDatePicker.bottomAnchor, constant: 15),
            priorityPicker.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 15),
            priorityPicker.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -15),
        ]
        NSLayoutConstraint.activate(priorityPickerConstraints)
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.scrollView.scrollRectToVisible(textField.frame, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }

}

