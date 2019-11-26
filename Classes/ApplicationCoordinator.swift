//
//  ApplicationCoordinator.swift
//  CombineTest
//
//  Created by Pierre Felgines on 05/09/16.
//
//

import Foundation

class ApplicationCoordinator: Coordinator {

    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    // MARK: - Coordinator

    func start() {
        window.rootViewController = SharedViewController()
    }
}
