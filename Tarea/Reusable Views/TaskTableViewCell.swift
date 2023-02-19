//
//  TaskTableViewCell.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 18/02/2023.
//

import UIKit

protocol CellDelegates: AnyObject {
    func setTitle(_ title: String)
    func setDueTime(_ subTitle: String)
    func setPriority(_ priority: Priority)
    func disableCell()
}

final class TaskTableViewCell: BaseUITableViewCell {
            
    private var containerView: BaseUIView = {
        let baseView = BaseUIView()
        baseView.backgroundColor = .systemGray5
        baseView.clipsToBounds = true
        baseView.setCornerRadius()
        return baseView
    }()
    
    private var taskPriority: PriorityCircle = {
        let baseCircle = PriorityCircle()
        baseCircle.setPriority(.low)
        return baseCircle
    }()
    
    private var taskTitleLabel: BaseUILabel = {
        let baseLabel = BaseUILabel()
        baseLabel.text = ""
        baseLabel.setContentHuggingPriority(.required, for: .vertical)
        return baseLabel
    }()
        
    private var taskDueLabel: BaseUILabel = {
        let baseLabel = BaseUILabel(style: .secondary)
        baseLabel.text = ""
        baseLabel.setContentHuggingPriority(.required, for: .vertical)
        return baseLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: nil)
        self.layoutCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.taskDueLabel.text = ""
        self.taskTitleLabel.text = ""
        self.taskPriority.setPriority(.high)
    }
    
}

extension TaskTableViewCell {
    
    private func layoutCell() {
        setupContainerView()
        setupTaskPriority()
        setupTaskTitleLabel()
        setupTaskDueLabel()
    }
    
    private func setupContainerView() {

        self.addSubview(containerView)
        let containerViewConstraints = [
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ]
        NSLayoutConstraint.activate(containerViewConstraints)

    }
 
    private func setupTaskPriority() {
        
        self.containerView.addSubview(taskPriority)
        let taskPriorityConstraints = [
            taskPriority.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 15),
            taskPriority.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -15),
            taskPriority.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 10),
        ]
        NSLayoutConstraint.activate(taskPriorityConstraints)

    }
    
    
    private func setupTaskTitleLabel() {
        
        self.containerView.addSubview(taskTitleLabel)
        let taskTitleConstraints = [
            taskTitleLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 10),
            taskTitleLabel.leadingAnchor.constraint(equalTo: taskPriority.trailingAnchor, constant: 10),
            taskTitleLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -10)
        ]
        NSLayoutConstraint.activate(taskTitleConstraints)

    }
    
    private func setupTaskDueLabel() {
        
        self.containerView.addSubview(taskDueLabel)
        let taskDueLabelConstraints = [
            taskDueLabel.topAnchor.constraint(equalTo: taskTitleLabel.bottomAnchor),
            taskDueLabel.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -10),
            taskDueLabel.leadingAnchor.constraint(equalTo: taskPriority.trailingAnchor, constant: 10),
            taskDueLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -10),
        ]
        NSLayoutConstraint.activate(taskDueLabelConstraints)

    }
    
}

extension TaskTableViewCell: CellDelegates {
    
    
    func setTitle(_ title: String) {
        self.taskTitleLabel.text = title
    }
    
    func setDueTime(_ dueTime: String) {
        self.taskDueLabel.text = dueTime
    }
    
    func setPriority(_ priority: Priority) {
        self.taskPriority.setPriority(priority)
    }

    func disableCell() {
        self.containerView.isUserInteractionEnabled.toggle()
        self.contentView.isUserInteractionEnabled.toggle()
        self.isUserInteractionEnabled.toggle()
        self.taskTitleLabel.attributedText = buildStrikeString(self.taskTitleLabel.text!)
        self.taskDueLabel.attributedText = buildStrikeString(self.taskDueLabel.text!)
    }
    
    private func buildStrikeString(_ string: String) -> NSAttributedString {
        let attributedText = NSAttributedString(
            string: string,
            attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue]
        )
        return attributedText

    }
    
}
