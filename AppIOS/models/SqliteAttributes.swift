//
// Created by Gilberto Freitas on 08/09/2018.
// Copyright (c) 2018 Gilberto Freitas. All rights reserved.
//

import Foundation

class SqliteAttributes {

    var table: String
    var conditionField: String
    var listGetField: [String]
    var condition: Any

    var field: String {
        get {
            if !Utils.checkIsEmpty(listString: listGetField) {
                return listGetField.joined(separator: ", ")
            }

            return ""
        }
    }

    init(table: String) {
        self.table = table
        self.conditionField = ""
        self.listGetField = []
        self.condition = ""
    }

    convenience init(table: String, listGetField: [String]) {
        self.init(table: table)
        self.listGetField = listGetField
    }

    convenience init(table: String, conditionField: String, condition: Any) {
        self.init(table: table)
        self.conditionField = conditionField
        self.condition = condition
    }


    convenience init(table: String, conditionField: String, listGetField: [String], condition: Any) {
        self.init(table: table, conditionField: conditionField, condition: condition)
        self.listGetField = listGetField
    }
}
