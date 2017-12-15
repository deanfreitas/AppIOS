//
// Created by Gilberto Freitas on 15/12/17.
// Copyright (c) 2017 Gilberto Freitas. All rights reserved.
//

import Foundation

class Valid {
    private func checkIsEmpty(string: String!) -> Bool {
        return string.isEmpty
    }

    func checkIsLogin(login: Login) -> String {
        var message: String = "You need send your: "
        var isValidLogin: Bool = true

        if checkIsEmpty(string: login.user) {
            message += "\n login"
            isValidLogin = false
        }

        if checkIsEmpty(string: login.password) {
            message += "\n password"
            isValidLogin = false
        }

        return !isValidLogin ? message : ""
    }
}
