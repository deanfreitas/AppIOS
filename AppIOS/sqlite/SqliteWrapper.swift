//
// Created by Gilberto Freitas on 14/12/17.
// Copyright (c) 2017 Gilberto Freitas. All rights reserved.
//

import Foundation
import SQLite3

class SqliteWrapper {

    private let file: String = "/development/workspace/AppIOS/AppIOS/resource/db/app.db"

    private var db: OpaquePointer?

    func openDatabase() throws -> OpaquePointer? {
        if db == nil {
            if sqlite3_open(file, &db) == SQLITE_OK {
                return db
            } else {
                throw SqliteError.openDatabase("error opening database")
            }
        }
        return db
    }
}