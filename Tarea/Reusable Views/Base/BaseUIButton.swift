//
//  BaseUIButton.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 18/02/2023.
//

import UIKit

class BaseUIButton: UIButton {
    
    init() {
        super.init(frame: CGRect.zero)
        self.setupButton()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setCornerRadius()
    }
    
    private func setupButton() {
        
        self.disableAutoResizingMask()
        setColors()
    }
    
    func setColors(_ backgroundColor: UIColor = .systemBlue, textColor: UIColor = .white) {
        let paddingSpace = 15.00
        if #available(iOS 15.00, *) {
            var buttonConfiguration = UIButton.Configuration.filled()
            buttonConfiguration.contentInsets = NSDirectionalEdgeInsets(
                top: paddingSpace, leading: paddingSpace,
                bottom: paddingSpace, trailing: paddingSpace
            )
            buttonConfiguration.baseBackgroundColor = backgroundColor
            buttonConfiguration.baseForegroundColor = textColor
            self.configuration = buttonConfiguration
        } else {
            self.contentEdgeInsets = UIEdgeInsets.init(
                top: paddingSpace, left: paddingSpace,
                bottom: paddingSpace, right: paddingSpace
            )
            self.backgroundColor = backgroundColor
            self.setTitleColor(textColor, for: .normal)
        }

    }
    
    func setImage(_ baseImageName: UIImage.baseImageNames) {
        super.setImage(.createBaseImage(baseImageName, color: .white), for: .normal)
    }
    
    func setTitle(_ title: String) {
        super.setTitle(title, for: .normal)
    }
}

