//
// Created by Gilberto Freitas on 09/09/2018.
// Copyright (c) 2018 Gilberto Freitas. All rights reserved.
//

import Foundation
import SQLite3

class SqliteColumn {
    func getNumberColumn(queryStatement: OpaquePointer) -> Int {
        return Int(sqlite3_column_count(queryStatement))
    }

    func getNameColumn(queryStatement: OpaquePointer, number: Int) -> String {
        return String(cString: sqlite3_column_name(queryStatement, Int32(number)))
    }

    func getValue(queryStatement: OpaquePointer, number: Int) -> Any? {
        let columnType: Int = Int(sqlite3_column_type(queryStatement, Int32(number)))

        if columnType == SQLITE3_TEXT {
            return String(cString: sqlite3_column_text(queryStatement, Int32(number)))
        } else if columnType == SQLITE_INTEGER {
            return Int(sqlite3_column_int(queryStatement, Int32(number)))
        } else if columnType == SQLITE_FLOAT {
            return Double(sqlite3_column_double(queryStatement, Int32(number)))
        }

        return nil
    }
}
