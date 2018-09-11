//
// Created by Gilberto Freitas on 08/09/2018.
// Copyright (c) 2018 Gilberto Freitas. All rights reserved.
//

import Foundation

extension SqliteAttributes {

    struct Select {
        static var conditionField: String = ""
        static var condition: Any = ""
    }

    var conditionField: String {
        set {
            Select.conditionField = newValue
        }

        get {
            return Select.conditionField
        }
    }

    var condition: Any {
        set {
            Select.condition = newValue
        }

        get {
            return Select.condition
        }
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
