//
//  BaseUITextField.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 18/02/2023.
//

import UIKit

final class BaseUITextField: UITextField {
    
    private var padding: UIEdgeInsets {
        var padding: UIEdgeInsets = .init()
        padding.top = 15.0
        padding.bottom = 15.0
        padding.right = 37.5
        if leftViewMode == .always {
            padding.left = 37.5
        } else {
            padding.left = 15.0
        }
        return padding
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func borderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        let leftRectBounds = super.leftViewRect(forBounds: bounds)
        return leftRectBounds.offsetBy(dx: 10.00, dy: 0.00)
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let rightViewBounds = super.rightViewRect(forBounds: bounds)
        return rightViewBounds.offsetBy(dx: -10.00, dy: 0.00)
    }
    
    override func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        let clearButtonBounds = super.clearButtonRect(forBounds: bounds)
        return clearButtonBounds.offsetBy(dx: -10.00, dy: 0.00)
    }
    
    init() {
        super.init(frame: CGRect.zero)
        self.setupTextField()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setCornerRadius()
    }
    
    private func setupTextField() {
        self.disableAutoResizingMask()
        self.backgroundColor = .systemGray5
        self.clearButtonMode = .always
    }
    
    func setPlaceHolder(_ message: String) {
        self.attributedPlaceholder = NSAttributedString(string: message, attributes: [.foregroundColor: UIColor.secondaryLabel])
    }
    
    func setLeftImage(_ baseImageName: UIImage.baseImageNames) {
        let baseImageView = BaseUIImageView()
        baseImageView.enableAutoResizingMask()
        baseImageView.setImage(baseImageName)
        self.leftView = baseImageView
        self.leftViewMode = .always
    }

}
