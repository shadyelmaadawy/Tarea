//
//  PriorityCircle.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 18/02/2023.
//

import UIKit

final class PriorityCircle: BaseUIView {
    
    override init() {
        super.init()
        self.setupCircle()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setCornerRadius(self.bounds.height / 2)
    }
    
    private func setupCircle() {
        self.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        self.clipsToBounds = true
    }
    
    func setPriority(_ priority: Priority) {
        switch(priority) {
            case .high:
                self.backgroundColor = .systemRed
            case .medium:
                self.backgroundColor = .systemBlue
            case .low:
                self.backgroundColor = .systemGreen
        }
    }
    
}
