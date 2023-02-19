//
//  BaseUIViewController.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 18/02/2023.
//

import UIKit

protocol BaseViewControllerDelegates: AnyObject {
    func showAlertView(alertMessage: String)
    func showConfirmationView(alertMessage: String, handler: @escaping (Bool) -> Void)
}

class BaseUIViewController: UIViewController, BaseViewControllerDelegates {
    
    enum baseViewControllerTitles: String {
        case tasks = "Tasks"
        case createTask = "Create a new task!"
    }
    
    // MARK: - Properties
    
    lazy var safeArea: UILayoutGuide = {
        return self.view.safeAreaLayoutGuide
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupViewController()
    }
    
    func showAlertView(alertMessage: String) {
        let alertController = UIAlertController(title: nil, message: alertMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true)
    }
    
    func showConfirmationView(alertMessage: String, handler: @escaping (Bool) -> Void) {
        let alertController = UIAlertController(title: nil, message: alertMessage, preferredStyle: .actionSheet)
        let continueButton = UIAlertAction(title: "CONTINUE", style: .destructive) { _ in
            handler(true)
        }
        alertController.addAction(continueButton)
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            handler(false)
        })
        alertController.addAction(cancelButton)
        self.present(alertController, animated: true)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewController() {
        self.view.backgroundColor = .backgroundColor
    }
    
    func setTitle(_ baseTitle: baseViewControllerTitles) {
        self.title = baseTitle.rawValue
    }
    
}


