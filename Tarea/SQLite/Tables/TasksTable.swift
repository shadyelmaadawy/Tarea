//
//  TasksTable.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 19/02/2023.
//

import SQLite

final class TasksTable: SQLiteTable {
    
    var tableName: String {
        return "Tasks_Table"
    }
    
    var blockBuilder:  (TableBuilder) -> Void {
        return { tableBuilder in
            tableBuilder.column(Expression<String>("uuid"), primaryKey: true)
            tableBuilder.column(Expression<String>("task_title"))
            tableBuilder.column(Expression<Date>("due_date"))
            tableBuilder.column(Expression<Int>("task_priority"))
            tableBuilder.column(Expression<Bool>("task_completed"))
        }
    }
}
