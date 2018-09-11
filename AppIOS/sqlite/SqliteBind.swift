//
// Created by Gilberto Freitas on 10/09/2018.
// Copyright (c) 2018 Gilberto Freitas. All rights reserved.
//

import Foundation
import SQLite3

class SqliteBind {
    func addBindInQuery(query: String, queryStatement: OpaquePointer, valuesBind: Any...) {
        let listCharacters: [Character] = Utils.convertStringToArrayCharacters(string: query)
        let constBind: Int = Utils.getNumberBind(listCharacter: listCharacters, character: "?")

        for number in 0..<constBind {
            if Utils.checkTypeObject(object: valuesBind[number], typeObject: String.self) {
                let value = valuesBind[number] as! NSString
                sqlite3_bind_text(queryStatement, 1, value.utf8String, -1, nil)
            } else if Utils.checkTypeObject(object: valuesBind[number], typeObject: Int32.self) {
                sqlite3_bind_int(queryStatement, Int32(number), valuesBind[number] as! Int32)
            } else if Utils.checkTypeObject(object: valuesBind[number], typeObject: Double.self) {
                sqlite3_bind_double(queryStatement, Int32(number), valuesBind[number] as! Double)
            } else {
                sqlite3_bind_null(queryStatement, Int32(number))
            }
        }
    }
}
