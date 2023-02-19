//
//  BaseUIDatePicker.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 18/02/2023.
//

import UIKit

final class BaseUIDatePicker: UIDatePicker {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupDatePicker()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupDatePicker() {
        self.disableAutoResizingMask()
        self.datePickerMode = .date
        if #available(iOS 15, *) {
            self.minimumDate = .now
        } else {
            self.minimumDate = .distantFuture
        }
    }
}

