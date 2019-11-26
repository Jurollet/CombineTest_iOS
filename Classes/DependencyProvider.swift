//
//  DependencyProvider.swift
//  CombineTest
//
//  Created by Pierre Felgines on 30/11/16.
//
//

import Foundation
import Swinject

class DependencyProvider {

    static let shared = DependencyProvider()

    private let moduleAssembler: Assembler
    private let presenterAssembler: Assembler

    private init() {
        moduleAssembler = Assembler([ModuleAssembly()])
        presenterAssembler = Assembler([
            HelperAssembly(),
            RepositoryAssembly(),
            InteractorAssembly(),
            PresenterAssembly(),
        ])
    }

    // MARK: - Modules

    func moduleLauncher() -> ModuleLauncher {
        return moduleAssembler.resolver.resolve(ModuleLauncher.self)!
    }

    // MARK: - Presenters

    func homePresenter(viewContract: HomeViewContract,
                       delegate: HomePresenterDelegate) -> HomePresenter? {
        return presenterAssembler.resolver.resolve(
            HomePresenter.self,
            arguments: viewContract, delegate
        )
    }

    func testPromisesPresenter(viewContract: TestPromisesViewContract) -> TestPromisesPresenter? {
        return presenterAssembler.resolver.resolve(
            TestPromisesPresenter.self,
            argument: viewContract
        )
    }

    func testCombinePresenter(viewContract: TestCombineViewContract) -> TestCombinePresenter? {
        return presenterAssembler.resolver.resolve(
            TestCombinePresenter.self,
            argument: viewContract
        )
    }
}
