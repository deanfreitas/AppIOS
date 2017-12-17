//
// Created by Gilberto Freitas on 17/12/17.
// Copyright (c) 2017 Gilberto Freitas. All rights reserved.
//

import Foundation
import SQLite3

class SqliteService {

    private let sqliteWrapper: SqliteWrapper = SqliteWrapper()

    func select(query: Select!, field: String!, condition: Any!) throws -> OpaquePointer! {
        let connect = try self.sqliteWrapper.openDatabase()
        var queryStatement: OpaquePointer?
        var result = sqlite3_prepare_v2(connect, query.rawValue, -1, &queryStatement, nil)

        if result != SQLITE_OK {
            throw SqliteError.select("Select statement could not be prepared")
        }

        if field == "id" {
            sqlite3_bind_int(queryStatement, 1, condition as! Int32)
        } else {
            let value = condition as! NSString
            sqlite3_bind_text(queryStatement, 1, value.utf8String, -1, nil)
        }

        result = sqlite3_step(queryStatement)

        if result != SQLITE_ROW {
            throw SqliteError.selectNotFound("Query returned no results")
        }

        if queryStatement == nil {
            throw SqliteError.selectNotFound("Not found results")
        }

        return queryStatement
    }

    func select(query: Select!) throws -> [OpaquePointer]! {
        let connect = try self.sqliteWrapper.openDatabase()
        var listResult = [OpaquePointer]()
        var queryStatement: OpaquePointer?
        var result = sqlite3_prepare_v2(connect, query.rawValue, -1, &queryStatement, nil)

        if result != SQLITE_OK {
            throw SqliteError.select("Select statement could not be prepared")
        }

        result = sqlite3_step(queryStatement)

        if result != SQLITE_ROW {
            throw SqliteError.select("Query returned no results")
        }

        while result == SQLITE_ROW {
            listResult.append(queryStatement!)
            result = sqlite3_step(queryStatement)
        }

        if listResult.isEmpty {
            throw SqliteError.select("Not found results")
        }

        return listResult
    }
}
