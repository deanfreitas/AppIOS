//
// Created by Gilberto Freitas on 17/12/17.
// Copyright (c) 2017 Gilberto Freitas. All rights reserved.
//

import Foundation
import SQLite3

class LoginTable {

    private let sqliteService: SqliteService = SqliteService()
    private let sqliteColumn: SqliteColumn = SqliteColumn()

    func selectLogin(attributes: SqliteAttributes) throws -> Any {
        let queryStatement: OpaquePointer! = try sqliteService.select(query: Select.selectWithCondition(attributes).query, attributes: attributes)

        var id: Int?
        var user: String?
        var password: String?

        for number in 0..<sqliteColumn.getNumberColumn(queryStatement: queryStatement) {
            let nameColumn = sqliteColumn.getNameColumn(queryStatement: queryStatement, number: number)

            if nameColumn.contains("id") {
                id = (sqliteColumn.getValue(queryStatement: queryStatement, number: number) as! Int)
            } else if nameColumn.contains("user") {
                user = (sqliteColumn.getValue(queryStatement: queryStatement, number: number) as! String)
            } else if nameColumn.contains("password") {
                password = (sqliteColumn.getValue(queryStatement: queryStatement, number: number) as! String)
            }
        }

        sqliteService.finalize()

        let login: Login = Login(id: id!, user: user!, password: password!)

        return login
    }
}
