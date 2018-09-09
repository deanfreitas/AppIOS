//
// Created by Gilberto Freitas on 16/12/17.
// Copyright (c) 2017 Gilberto Freitas. All rights reserved.
//

import Foundation

class SqliteTable {

    private let loginTable: LoginTable = LoginTable()

    func selectTable(attributes: SqliteAttributes) throws -> Any! {
        if !Utils.checkIsEmpty(string: attributes.field) && !Utils.checkIsEmpty(string: attributes.condition as! String) {
            return try loginTable.selectLogin(attributes: attributes)
        }

        return nil
    }

    func selectAllTableTable(attributes: SqliteAttributes) throws -> [Any]! {
        return try loginTable.selectAllTableLogin(attributes: attributes)
    }
}
