//
//  BaseUIImageView.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 18/02/2023.
//

import UIKit

final class BaseUIImageView: UIImageView {
    
    init() {
        super.init(frame: CGRect.zero)
        self.setupImageView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImageView() {
        self.disableAutoResizingMask()
    }
    
    func setImage(_ baseName: UIImage.baseImageNames, color: UIColor = .systemGray) {
        self.image = .createBaseImage(baseName, color: color)
    }
    
}
