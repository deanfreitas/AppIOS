//
// Created by Gilberto Freitas on 16/12/17.
// Copyright (c) 2017 Gilberto Freitas. All rights reserved.
//

import Foundation

enum Select {
    case select(SqliteAttributes)
    case selectWithCondition(SqliteAttributes)
    case selectWithConditionNotEqual(SqliteAttributes)

    var query: String {
        switch self {
        case .select(let attributes): return "select \(attributes.field) from \(attributes.table);"
        case .selectWithCondition(let attributes): return "select \(attributes.field) from \(attributes.table) \(attributes.getEqualConditions);"
        case .selectWithConditionNotEqual(let attributes): return "select \(attributes.field) from \(attributes.table) \(attributes.getNotEqualConditions);"
        }
    }
}
