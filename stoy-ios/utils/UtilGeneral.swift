//
//  UtilGeneral.swift
//  stoy-ios
//
//  Created by 中田伊織 on 2023/09/19.
//

import Foundation
import Alamofire

class UtilGeneral {
    public static func structToStringDictionary<T>(_ instance: T) -> [String: String] {
        let mirror = Mirror(reflecting: instance)
        var dictionary: [String: String] = [:]

        for case let (label?, value) in mirror.children {
            if let stringValue = value as? CustomStringConvertible {
                dictionary[label] = stringValue.description
            }
        }

        return dictionary
    }
}
