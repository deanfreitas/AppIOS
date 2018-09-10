//
// Created by Gilberto Freitas on 09/09/2018.
// Copyright (c) 2018 Gilberto Freitas. All rights reserved.
//

import Foundation

enum GenericError: String, Error {
    case accessVariable
    case system

    var getError: String {
        switch self {
        case .system: return "System error"
        case .accessVariable: return ""
        }
    }
}
