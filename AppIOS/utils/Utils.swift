//
// Created by Gilberto Freitas on 17/12/17.
// Copyright (c) 2017 Gilberto Freitas. All rights reserved.
//

import Foundation


class Utils {
    static func checkIsEmpty(string: String!) -> Bool {
        return string == nil || string.isEmpty
    }

    static func checkIsEmpty(listString: [String]!) -> Bool {
        return listString == nil || listString.isEmpty
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
}
