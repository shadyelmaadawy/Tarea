//
//  UITableView+Ext.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 18/02/2023.
//

import UIKit

extension UITableView {
    
    func register(_ cellType: UITableViewCell.Type) {
        let baseName: String = cellType.reusableIdentifier
        self.register(cellType, forCellReuseIdentifier: baseName)
    }
    
    func dequeue<RequiredTableViewCell: UITableViewCell>() -> RequiredTableViewCell {
        let baseName: String = RequiredTableViewCell.reusableIdentifier
        guard let baseCell = self.dequeueReusableCell(withIdentifier: baseName) as? RequiredTableViewCell else {
            fatalError("Cannot dequeue cell!")
        }
        return baseCell
    }

}
