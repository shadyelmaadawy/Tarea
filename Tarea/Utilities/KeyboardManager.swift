//
//  KeyboardManager.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 18/02/2023.
//

import UIKit

final class KeyboardManager {

    // MARK: - Properties
    
    private weak var view: UIView?
    
    private var bottomLayoutConstraints: NSLayoutConstraint

    private var bottomConstantValue: CGFloat
    
    // MARK: - Initialization
    
    init(view: UIView, _ bottomLayoutConstraints: NSLayoutConstraint) {
        self.view = view
        self.bottomLayoutConstraints = bottomLayoutConstraints
        self.bottomConstantValue = bottomLayoutConstraints.constant
        self.setupKeyboardManager()
    }
    
    // MARK: - Object Life Cycle
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    private func setupKeyboardManager() {
        NotificationCenter.default.addObserver(
            self, selector: #selector(keyboardWillShow(_:)),
            name: UIResponder.keyboardWillShowNotification, object: nil
        )
        NotificationCenter.default.addObserver(
            self, selector: #selector(keyboardWillHide(_:)),
            name: UIResponder.keyboardWillHideNotification, object: nil
        )
    }
    
    @objc private func keyboardWillHide(_ sender: NSNotification!) {
        self.bottomLayoutConstraints.constant = self.bottomConstantValue
        UIView.animate(withDuration: 0.15) { [ weak self] in
            guard let self = self else { return }
            guard let view = self.view else { return }
            view.layoutIfNeeded()
        }
    }
    
    @objc private func keyboardWillShow(_ sender: NSNotification) {
        guard let userInfo = sender.userInfo,
              let keyboardHeight = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size.height else { return }
        self.bottomLayoutConstraints.constant = -keyboardHeight - 20
        UIView.animate(withDuration: 0.15) { [ weak self] in
            guard let self = self else { return }
            guard let view = self.view else { return }
            view.layoutIfNeeded()
        }
    }

}
