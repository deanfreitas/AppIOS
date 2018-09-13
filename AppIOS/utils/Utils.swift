//
// Created by Gilberto Freitas on 17/12/17.
// Copyright (c) 2017 Gilberto Freitas. All rights reserved.
//

import Foundation


class Utils {
    static func checkIsEmpty(value: Any!) -> Bool {
        if value != nil {
            if checkTypeObject(object: value, typeObject: String.self) {
                return (value as! String).isEmpty
            } else if checkTypeObject(object: value, typeObject: Array<String>.self) {
                return (value as! Array<String>).isEmpty
            } else if checkTypeObject(object: value, typeObject: Dictionary<String, Any>.self) {
                return (value as! Dictionary<String, Any>).isEmpty
            }
        }

        return true
    }

    static func checkTypeObject<T>(object: Any, typeObject: T.Type) -> Bool {
        return type(of: object) == typeObject
    }

    static func convertStringToArrayCharacters(string: String) -> [Character] {
        return Array(string)
    }

    static func getNumberBind(listCharacter: [Character], character: Character) -> Int {
        var counts: Int = 0

        listCharacter.forEach {
            if $0 == character {
                counts += 1
            }
        }

        return counts
    }

    static func createQuery(operatorEqual: String, listKeys: [String]) -> String {
        var query: String = ""

        for keys in listKeys {
            query.append(contentsOf: "where ")
            query.append(contentsOf: keys)
            query.append(contentsOf: operatorEqual)
        }

        return query
    }
}
