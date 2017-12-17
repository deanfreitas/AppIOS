//
// Created by Gilberto Freitas on 16/12/17.
// Copyright (c) 2017 Gilberto Freitas. All rights reserved.
//

import Foundation

class SqliteTable {

    func selectTable(object: Any, fields: String = "") throws -> [Any]! {
        if object is Login {
            let loginTable: LoginTable = LoginTable()

            if Utils.checkIsEmpty(string: fields) {
                return try loginTable.selectLogin(query: Select.login)
            }
        }

        return nil
    }

    func selectTable(object: Any, field: String, condition: String) throws -> Any! {
        if object is Login {
            let loginTable: LoginTable = LoginTable()

            if !Utils.checkIsEmpty(string: field) {
                if field == "user" {
                    return try loginTable.selectLogin(query: Select.loginWithWhereUser, field: field, condition: condition)
                }
            }
        }

        return nil
    }
}
