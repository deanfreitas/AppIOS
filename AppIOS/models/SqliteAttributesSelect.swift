//
// Created by Gilberto Freitas on 13/09/2018.
// Copyright (c) 2018 Gilberto Freitas. All rights reserved.
//

import Foundation

extension SqliteAttributes {

    private struct Select {
        static var query: String = ""
    }

    var getEqualConditions: String {
        get {

            if Utils.checkIsEmpty(value: listBind.keys) {
                return Select.query
            }

            return Utils.createQuery(operatorEqual: " = ?", listKeys: [String](listBind.keys))
        }
    }

    var getNotEqualConditions: String {
        get {

            if Utils.checkIsEmpty(value: listBind.keys) {
                return Select.query
            }

            return Utils.createQuery(operatorEqual: " != ?", listKeys: [String](listBind.keys))
        }
    }

    convenience init(query: String) {
        self.init(table: "")
        Select.query = query
    }
}
