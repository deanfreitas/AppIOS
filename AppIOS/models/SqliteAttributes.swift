//
// Created by Gilberto Freitas on 10/09/2018.
// Copyright (c) 2018 Gilberto Freitas. All rights reserved.
//

import Foundation

class SqliteAttributes {

    var table: String
    var listGetField: [String]

    var field: String {
        get {
            if !Utils.checkIsEmpty(listString: listGetField) {
                return listGetField.joined(separator: ", ")
            }

            return "*"
        }
    }

    init(table: String) {
        self.table = table
        self.listGetField = []
    }

    convenience init(table: String, listGetField: [String]) {
        self.init(table: table)
        self.listGetField = listGetField
    }
}
