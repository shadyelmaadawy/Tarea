//
//  NSObject+Ext.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 18/02/2023.
//

import Foundation

extension NSObject {
    
    /// A variable to get string identifier across all objects
    /// As an example: views, controllers, labels.. etc
    /// Example of usage, Self.reusableIdentifier
    class var reusableIdentifier: String {
        return String(describing: self)
    }

}


