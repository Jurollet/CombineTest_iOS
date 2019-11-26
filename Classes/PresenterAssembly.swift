//
//  PresenterAssembly.swift
//  CombineTest
//
//  Created by Pierre Felgines on 30/11/16.
//
//

import Foundation
import Swinject

class PresenterAssembly: Assembly {

    func assemble(container: Container) {
        container.register(HomePresenter.self) { _, viewContract, delegate in
            HomePresenterImplementation(viewContract: viewContract, delegate: delegate)
        }

        container.register(TestPromisesPresenter.self) { _, viewContract in
            TestPromisesPresenterImplementation(viewContract: viewContract)
        }

        container.register(TestCombinePresenter.self) { _, viewContract in
            TestCombinePresenterImplementation(viewContract: viewContract)
        }
    }
}
