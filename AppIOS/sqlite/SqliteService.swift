//
// Created by Gilberto Freitas on 17/12/17.
// Copyright (c) 2017 Gilberto Freitas. All rights reserved.
//

import Foundation
import SQLite3

class SqliteService {

    private let sqliteWrapper: SqliteWrapper = SqliteWrapper()
    private let sqliteBind: SqliteBind = SqliteBind()
    private var queryStatement: OpaquePointer?

    func select(query: String, attributes: SqliteAttributes) throws -> OpaquePointer! {
        let connect = try self.sqliteWrapper.openDatabase()
        var result: Int32 = sqlite3_prepare_v2(connect, query, -1, &queryStatement, nil)

        if result != SQLITE_OK {
            throw SqliteError.select
        }

        sqliteBind.addBindInQuery(query: query, queryStatement: queryStatement!, valuesBind: [Any](attributes.listBind.values))

        result = sqlite3_step(queryStatement)

        if result != SQLITE_ROW {
            throw SqliteError.selectNotFound
        }

        // TODO --> colocar para retornar uma lista de resultados select
        //while result == SQLITE_ROW {
        //    result = sqlite3_step(queryStatement)
        //}

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
