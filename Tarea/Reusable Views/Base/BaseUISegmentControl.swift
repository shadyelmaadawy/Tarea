//
//  BaseUISegmentedControl.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 19/02/2023.
//

import UIKit

final class BaseUISegmentedControl: UISegmentedControl {
    
    init(items: [String]) {
        super.init(items: items)
        setupSegment()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSegment() {
        self.disableAutoResizingMask()
        self.selectedSegmentTintColor = .systemBlue
        self.selectedSegmentIndex = 0
    }
    
}
