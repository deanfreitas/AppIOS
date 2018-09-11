//
// Created by Gilberto Freitas on 15/12/17.
// Copyright (c) 2017 Gilberto Freitas. All rights reserved.
//

import Foundation

class LoginUtils {

    func checkLoginIsEmpty(login: Login) -> String? {
        var message: String = "You need send your: "
        var isValidLogin: Bool = true

        if Utils.checkIsEmpty(string: login.user) {
            message += "\n login"
            isValidLogin = false
        }

        if Utils.checkIsEmpty(string: login.password) {
            message += "\n password"
            isValidLogin = false
        }

        return !isValidLogin ? message : nil
    }
}
