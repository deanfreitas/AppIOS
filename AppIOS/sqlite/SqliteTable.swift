//
// Created by Gilberto Freitas on 16/12/17.
// Copyright (c) 2017 Gilberto Freitas. All rights reserved.
//

import Foundation

class SqliteTable {

    private let loginTable: LoginTable = LoginTable()

    func selectTable(attributes: SqliteAttributes) throws -> Any! {
        if !Utils.checkIsEmpty(value: attributes.listBind) {
            return try loginTable.selectLogin(attributes: attributes)
        }

        throw GenericError.system
    }
}
