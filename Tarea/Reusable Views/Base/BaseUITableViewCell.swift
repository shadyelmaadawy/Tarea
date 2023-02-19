//
//  BaseUITableViewCell.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 18/02/2023.
//

import UIKit

class BaseUITableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
        
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        self.selectionStyle = .none
        self.backgroundColor = .backgroundColor
    }
}

