//
// Created by Gilberto Freitas on 17/12/17.
// Copyright (c) 2017 Gilberto Freitas. All rights reserved.
//

import Foundation
import SQLite3

class SqliteService {

    private let sqliteWrapper: SqliteWrapper = SqliteWrapper()
    private var queryStatement: OpaquePointer?

    func select(query: String, attributes: SqliteAttributes) throws -> OpaquePointer! {
        let connect = try self.sqliteWrapper.openDatabase()
        var result: Int32 = sqlite3_prepare_v2(connect, query, -1, &queryStatement, nil)

        if result != SQLITE_OK {
            throw SqliteError.select
        }

        if attributes.field == "id" {
            sqlite3_bind_int(queryStatement, 1, attributes.condition as! Int32)
        } else {
            let value = attributes.condition as! NSString
            sqlite3_bind_text(queryStatement, 1, value.utf8String, -1, nil)
        }

        result = sqlite3_step(queryStatement)

        if result != SQLITE_ROW {
            throw SqliteError.selectNotFound
        }

        if queryStatement == nil {
            throw SqliteError.selectNotFoundValues
        }

        return queryStatement
    }

    func finalize() {
        if queryStatement != nil {
            sqlite3_finalize(queryStatement)
        }

        self.sqliteWrapper.closeDatabase()
    }
}
