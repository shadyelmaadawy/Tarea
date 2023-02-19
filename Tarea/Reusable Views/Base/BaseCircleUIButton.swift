//
//  BaseCircleUIButton.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 18/02/2023.
//

import UIKit


final class BaseCircleUIButton: BaseUIButton {
    
    override init() {
        super.init()
        self.setupButton()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setCornerRadius(self.bounds.height / 2)
    }
    
    private func setupButton() {
        self.heightAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
    
}
