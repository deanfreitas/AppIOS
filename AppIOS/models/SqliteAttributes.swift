//
// Created by Gilberto Freitas on 10/09/2018.
// Copyright (c) 2018 Gilberto Freitas. All rights reserved.
//

import Foundation

class SqliteAttributes {

    var table: String
    var listGetField: [String]
    var listBind: [String: Any]

    var field: String {
        get {
            if !Utils.checkIsEmpty(value: listGetField) {
                return listGetField.joined(separator: ", ")
            }

            return "*"
        }
    }

    init(table: String) {
        self.table = table
        self.listGetField = []
        self.listBind = [:]
    }

    convenience init(table: String, listGetField: [String]) {
        self.init(table: table)
        self.listGetField = listGetField
    }

    convenience init(table: String, listBind: [String: Any]) {
        self.init(table: table)
        self.listBind = listBind
    }

    convenience init(table: String, listGetField: [String], listBind: [String: Any]) {
        self.init(table: table)
        self.listGetField = listGetField
        self.listBind = listBind
    }
}
