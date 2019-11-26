//
//  DecodingError+Debug.swift
//  CombineTest
//
//  Created by Denis Poifol on 14/09/2018.
//

import Foundation

extension DecodingError {
    var context: Context {
        switch self {
        case let .dataCorrupted(context):
            return context
        case let .keyNotFound(_, context):
            return context
        case let .typeMismatch(_, context):
            return context
        case let .valueNotFound(_, context):
            return context
        @unknown default:
            fatalError("This case should not happen")
        }
    }
}
