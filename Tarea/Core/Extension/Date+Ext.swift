//
//  Date+Ext.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 19/02/2023.
//

import Foundation

extension Date {
    
    func fixDate() -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat =  "yyyy-MM-dd"
        return dateFormat.string(from: self)
    }
}
