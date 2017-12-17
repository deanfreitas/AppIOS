//
// Created by Gilberto Freitas on 16/12/17.
// Copyright (c) 2017 Gilberto Freitas. All rights reserved.
//

import Foundation

enum SqliteError: Error {
    case database(String)
    case select(String)
    case selectNotFound(String)
    case insert(String)
    case update(String)
    case delete(String)
}
