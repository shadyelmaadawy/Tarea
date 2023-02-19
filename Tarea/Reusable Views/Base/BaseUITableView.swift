//
//  BaseUITableView.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 18/02/2023.
//

import UIKit

final class BaseUITableView: UITableView {
    
    private var emptyMessageLabel: UILabel = {
        let baseLabel = UILabel()
        baseLabel.text = "You don't save any reminders yet.\nyou can create by clicking (+) button."
        baseLabel.font = .preferredFont(forTextStyle: .headline)
        baseLabel.textAlignment = .center
        baseLabel.textColor = .secondaryLabel
        baseLabel.numberOfLines = 0
        baseLabel.isHidden = true
        baseLabel.backgroundColor = .backgroundColor
        return baseLabel
    }()
    
    init() {
        super.init(frame: CGRect.zero, style: .plain)
        setupTableView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        self.disableAutoResizingMask()
        self.backgroundColor = .backgroundColor
        self.separatorStyle = .none
        self.backgroundView = self.emptyMessageLabel
  }
    
    func setDelegates(_ delegates: UITableViewDelegate) {
        self.delegate = delegates
    }
    
    func setDataSource(_ dataSource: UITableViewDataSource) {
        self.dataSource = dataSource
    }
    
    func showEmptyMessageLabel() {
        if(self.emptyMessageLabel.isHidden == true) {
            self.emptyMessageLabel.isHidden.toggle()
        }
    }
    
    func hideEmptyMessageLabel() {
        if(self.emptyMessageLabel.isHidden == false) {
            self.emptyMessageLabel.isHidden.toggle()
        }
    }

}
