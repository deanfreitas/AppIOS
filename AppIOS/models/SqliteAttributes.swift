//
// Created by Gilberto Freitas on 08/09/2018.
// Copyright (c) 2018 Gilberto Freitas. All rights reserved.
//

import Foundation

class SqliteAttributes {
    var table: String
    var field: String
    var condition: Any

    init(table: String) {
        self.table = table
        self.field = ""
        self.condition = ""
    }

    convenience init(table: String, field: String) {
        self.init(table: table)
        self.field = field
    }

    convenience init(table: String, field: String, condition: Any) {
        self.init(table: table, field: field)
        self.condition = condition
    }
}
