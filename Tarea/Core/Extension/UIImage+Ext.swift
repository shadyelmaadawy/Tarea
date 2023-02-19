//
//  UIImage+Ext.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 18/02/2023.
//

import UIKit

extension UIImage {

    enum baseImageNames: String {
        case add = "plus"
        case time = "clock.fill"
        case delete = "trash.fill"
        case priority = "list.clipboard"
    }
    
    class func createBaseImage(_ baseName: baseImageNames, color: UIColor = .systemGray) -> UIImage {
        guard let baseImage = UIImage(systemName: baseName.rawValue) else {
            fatalError("Cannot found image")
        }
        return baseImage.withTintColor(color, renderingMode: .alwaysOriginal)
    }

}

