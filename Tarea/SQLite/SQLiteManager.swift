//
//  SQLiteManager.swift
//  Tarea
//
//  Created by Shady K. Maadawy on 19/02/2023.
//

import SQLite
import Foundation

final class SQLiteManager<T: Codable> {
    
    // MARK: - Concurrency Properties
    
    private var sqliteQueue: DispatchQueue! {
        return DispatchQueue(label: "...", qos: .userInitiated, attributes: .concurrent)
    }
    // MARK: - Configuration
    
    typealias T = T
    
    // MARK: - Properties

    private var databaseConnection: Connection! {
        do {
            guard let coreDatabasePath = NSSearchPathForDirectoriesInDomains(
                .documentDirectory, .userDomainMask, true).first else {
                fatalError("Cannot query document directory")
            }
            let baseConnection = try Connection("\(coreDatabasePath)/core.sqlite3")
            return baseConnection
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    private let sqliteTable: Table
    
    // MARK: - Initialization
    
    init(_ sqliteTableBlockBuilder: SQLiteTable) {
        do {
            self.sqliteTable = .init(sqliteTableBlockBuilder.tableName)
            try self.configureTable(sqliteTableBlockBuilder)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    // MARK: - Object Life Cycle
    
    deinit {
        print("deinit \(self)")
    }
    
    // MARK: - Functions
    
    private func configureTable(_ blockBuilder: SQLiteTable) throws {
        try self.databaseConnection.run(self.sqliteTable.create(temporary: false, ifNotExists: true, block: blockBuilder.blockBuilder))
    }
    
    // MARK: ~ C R U D
    
    func create(_ row: T, handler: @escaping(Swift.Result<T, Error>) -> ()) {
        self.sqliteQueue.async {
            do {
                try self.databaseConnection.run(self.sqliteTable.insert(row))
                DispatchQueue.main.async {
                    handler(.success(row))
                }
            } catch {
                DispatchQueue.main.async {
                    handler(.failure(error))
                }
            }
        }
    }
    
    func read(handler: @escaping(Swift.Result<[T], Error>) -> ()) {
        self.sqliteQueue.async {
            do {
                let mappedRows: [T] = try self.databaseConnection.prepare(self.sqliteTable).map { sqliteRow in
                    return try sqliteRow.decode()
                }
                DispatchQueue.main.async {
                    handler(.success(mappedRows))
                }
            } catch {
                DispatchQueue.main.async {
                    handler(.failure(error))
                }
            }
        }
    }
    
    func update(_ row: T, filterQuery: Expression<Bool> ,handler: @escaping(Swift.Result<Bool, Error>) -> ()) {
        self.sqliteQueue.async {
            do {
                try self.databaseConnection.run(self.sqliteTable.filter(filterQuery).update(row))
                DispatchQueue.main.async {
                    handler(.success(true))
                }
            } catch {
                DispatchQueue.main.async {
                    handler(.failure(error))
                }
            }
        }
    }
    
    func delete(_ predicate: Expression<Bool>, handler: @escaping(Swift.Result<Bool, Error>) -> ()) {
        self.sqliteQueue.async {
            do {
                let effectedRows = try self.databaseConnection.run(self.sqliteTable.filter(predicate).delete())
                DispatchQueue.main.async {
                    handler(.success(effectedRows > 0))
                }
            } catch {
                DispatchQueue.main.async {
                    handler(.failure(error))
                }
            }
        }
    }
}
