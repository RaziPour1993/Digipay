//
//  UIViewController.swift
//  Digipay
//
//  Created by Mohammad Razipour on 12/26/19.
//  Copyright © 2019 Mohammad Razipour. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    @objc func hideKeyboardWhenTap() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(false)
    }
    
    func showRetry(view: RetryView){
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)
        let safeArea = self.view.safeAreaLayoutGuide
        view.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: 0).isActive = true
        view.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: 50).isActive = true
        view.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 1.5).isActive = true
        view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 1.5).isActive = true
    }
    
}
