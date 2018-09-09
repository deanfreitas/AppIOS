//
// Created by Gilberto Freitas on 16/12/17.
// Copyright (c) 2017 Gilberto Freitas. All rights reserved.
//

import Foundation

enum Select {
    case select(SqliteAttributes)
    case selectColumn(SqliteAttributes)
    case selectWithCondition(SqliteAttributes)

    var query: String {
        switch self {
        case .select(let attributes): return "select * from \(attributes.table);"
        case .selectColumn(let attributes): return "select \(attributes.field) from \(attributes.table);"
        case .selectWithCondition(let attributes): return "select * from \(attributes.table) where \(attributes.field) = ?;"
        }
    }
}
