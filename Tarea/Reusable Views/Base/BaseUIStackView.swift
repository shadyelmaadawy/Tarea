//
//  BaseUIStackView.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 18/02/2023.
//

import UIKit

final class BaseUIStackView: UIStackView {
    
    init() {
        super.init(frame: CGRect.zero)
        self.setupStackView()
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStackView() {
        self.disableAutoResizingMask()
        self.backgroundColor = .clear
    }
    
}

