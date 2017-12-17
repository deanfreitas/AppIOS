//
// Created by Gilberto Freitas on 17/12/17.
// Copyright (c) 2017 Gilberto Freitas. All rights reserved.
//

import Foundation
import SQLite3

class LoginTable {

    private let sqliteService: SqliteService = SqliteService()

    func selectLogin(query: Select!) throws -> [Login]! {
        let listResult: [OpaquePointer]! = try self.sqliteService.select(query: query)
        var listLogin: [Login] = [Login]()

        for result in listResult {
            let id: Int = Int(sqlite3_column_int(result, 0))
            let user: String = String(cString: sqlite3_column_text(result, 1))
            let password: String = String(cString: sqlite3_column_text(result, 2))

            let login: Login = Login(id: id, user: user, password: password)
            listLogin.append(login)
        }

        return listLogin
    }

    func selectLogin(query: Select!, field: String!, condition: String!) throws -> Login! {
        let result: OpaquePointer! = try sqliteService.select(query: query, field: field, condition: condition)

        let id: Int = Int(sqlite3_column_int(result, 0))
        let user: String = String(cString: sqlite3_column_text(result, 1))
        let password: String = String(cString: sqlite3_column_text(result, 2))

        let login: Login = Login(id: id, user: user, password: password)

        return login
    }
}
