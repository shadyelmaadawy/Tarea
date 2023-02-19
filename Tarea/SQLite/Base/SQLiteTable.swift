//
//  SQLiteTable.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 19/02/2023.
//

import SQLite

protocol SQLiteTable: AnyObject {
    var tableName: String { get }
    var blockBuilder: (TableBuilder) -> Void { get }
}
