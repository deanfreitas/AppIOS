//
// Created by Gilberto Freitas on 12/12/17.
// Copyright (c) 2017 Gilberto Freitas. All rights reserved.
//

import Foundation

struct Login {
    var id: Int?;
    var user: String;
    var password: String;

    init(user: String, password: String) {
        self.user = user
        self.password = password
    }

    init(id: Int, user: String, password: String) {
        self.init(user: user, password: password)
        self.id = id
    }
}
