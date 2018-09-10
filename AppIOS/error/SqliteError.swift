//
// Created by Gilberto Freitas on 16/12/17.
// Copyright (c) 2017 Gilberto Freitas. All rights reserved.
//

import Foundation

enum SqliteError: String, Error {
    case database
    case select
    case selectNotFound
    case selectNotFoundValues
    case insert
    case update
    case delete

    var getError: String {
        switch self {
        case .database: return "Error opening database"
        case .select: return "Select statement could not be prepared"
        case .selectNotFound: return "Query returned no results"
        case .selectNotFoundValues: return "Not found results"
        case .insert: return ""
        case .update: return ""
        case .delete: return ""
        }
    }
}
