//
//  BaseUIScrollView.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 18/02/2023.
//

import UIKit

final class BaseUIScrollView: UIScrollView {
    
    init() {
        super.init(frame: CGRect.zero)
        setupScrollView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupScrollView() {
        self.disableAutoResizingMask()
    }
}

