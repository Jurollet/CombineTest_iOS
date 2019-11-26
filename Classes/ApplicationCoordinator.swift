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
        viewController.title = "Home"
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
        let viewController = TestPromisesViewController()
        viewController.title = "Promises"
        let presenter = DependencyProvider.shared.testPromisesPresenter(viewContract: viewController)
        viewController.presenter = presenter
        navigationController.pushViewController(viewController, animated: true)
    }

    func homePresenterDidSelectCombine(_ presenter: HomePresenter) {
        let viewController = TestCombineViewController()
        viewController.title = "Combine"
        let presenter = DependencyProvider.shared.testCombinePresenter(viewContract: viewController)
        viewController.presenter = presenter
        navigationController.pushViewController(viewController, animated: true)
    }
}
