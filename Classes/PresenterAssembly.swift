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
        container.register(HomePresenter.self) { r, viewContract, delegate in
            HomePresenterImplementation(viewContract: viewContract, delegate: delegate)
        }

    }
}
