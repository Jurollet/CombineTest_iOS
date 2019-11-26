//
//  ApplicationCoordinator.swift
//  CombineTest
//
//  Created by Pierre Felgines on 05/09/16.
//
//

import Foundation

class ApplicationCoordinator: Coordinator, HomePresenterDelegate {

    private let window: UIWindow
    private let navigationController = SharedNavigationController()

    init(window: UIWindow) {
        self.window = window
    }

    // MARK: - Coordinator

    func start() {
        let viewController = HomeViewController()
        let presenter = DependencyProvider.shared.homePresenter(
            viewContract: viewController,
            delegate: self
        )
        viewController.presenter = presenter
        navigationController.viewControllers = [viewController]
        window.rootViewController = navigationController
    }

    // MARK: - HomePresenterDelegate

    func homePresenterDidSelectPromises(_ presenter: HomePresenter) {
        // todo
    }

    func homePresenterDidSelectCombine(_ presenter: HomePresenter) {
        // todo
    }
}
