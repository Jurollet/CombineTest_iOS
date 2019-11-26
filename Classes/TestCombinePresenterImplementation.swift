//
//  TestCombinePresenterImplementation.swift
//  CombineTest
//
//  Created by Julien Rollet on 26/11/2019.
//

import Foundation

class TestCombinePresenterImplementation: TestCombinePresenter {

    private weak var viewContract: TestCombineViewContract?

    init(viewContract: TestCombineViewContract) {
        self.viewContract = viewContract
    }
}
