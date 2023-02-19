//
//  BaseUILabel.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 18/02/2023.
//

import UIKit

final class BaseUILabel: UILabel {
    
    enum labelStyle {
        case ordinary
        case secondary
    }
    
    init(style: labelStyle = .ordinary) {
        super.init(frame: CGRect.zero)
        self.setupBaseLabel(style)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBaseLabel(_ style: labelStyle) {
        self.disableAutoResizingMask()
        switch(style) {
            case .ordinary:
                self.font = .preferredFont(forTextStyle: .headline)
                self.textColor = .label
            case .secondary:
                self.font = .preferredFont(forTextStyle: .subheadline)
                self.textColor = .secondaryLabel
        }
    }
    
}

