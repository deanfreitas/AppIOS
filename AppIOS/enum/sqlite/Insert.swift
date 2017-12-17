//
// Created by Gilberto Freitas on 16/12/17.
// Copyright (c) 2017 Gilberto Freitas. All rights reserved.
//

import Foundation

enum Insert: String {
    case login = "insert into login(log_user, log_password) values (?, ?);"
}
