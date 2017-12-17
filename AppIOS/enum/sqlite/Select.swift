//
// Created by Gilberto Freitas on 16/12/17.
// Copyright (c) 2017 Gilberto Freitas. All rights reserved.
//

import Foundation

enum Select: String {
    case login = "select * from login;"
    case loginJustUser = "select log_user from login;"
    case loginWithWhereId = "select * from login where id_login = ?;"
    case loginWithWhereUser = "select * from login where log_user = ?;"
}
