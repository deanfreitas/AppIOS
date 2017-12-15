//
// Created by Gilberto Freitas on 14/12/17.
// Copyright (c) 2017 Gilberto Freitas. All rights reserved.
//

import Foundation
import SQLite3

class Sql {

    let file = try! FileManager.default.url(for: <#T##SearchPathDirectory##Foundation.FileManager.SearchPathDirectory#>, in: <#T##SearchPathDomainMask##Foundation.FileManager.SearchPathDomainMask#>, appropriateFor: <#T##URL?##Foundation.URL?#>, create: <#T##Bool##Swift.Bool#>)
            .appendingPathComponent("")

    var db: OpaquePointer?

    func openDatabase() -> OpaquePointer? {
        if sqlite3_open(file.path, &db) == SQLITE_OK {

        } else {
            print("error opening database")
        }
    }
}