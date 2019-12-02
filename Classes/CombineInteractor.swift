//
//  CombineInteractor.swift
//  CombineTest
//
//  Created by Julien Rollet on 27/11/2019.
//

import Foundation
import Combine

protocol CombineInteractor {
    associatedtype Input
    associatedtype Output
    associatedtype Failure: Error

    func execute(_ input: Input) -> AnyPublisher<Output, Failure>
}
