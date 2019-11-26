//
//  TestPromisesPresenterImplementation.swift
//  CombineTest
//
//  Created by Julien Rollet on 26/11/2019.
//

import Foundation

class TestPromisesPresenterImplementation: TestPromisesPresenter {

    private weak var viewContract: TestPromisesViewContract?

    init(viewContract: TestPromisesViewContract) {
        self.viewContract = viewContract
    }
}
