//
//  AppDelegate.swift
//  CombineTest
//
//  Created by Edouard Siegel on 03/03/16.
//
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var applicationCoordinator: ApplicationCoordinator?

    private lazy var moduleLauncher = DependencyProvider.shared.moduleLauncher()

    // MARK: - Application Events

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // swiftlint:disable:previous discouraged_optional_collection
        launchModules()

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.applyStyle(.main)
        self.window = window

        applicationCoordinator = ApplicationCoordinator(window: window)
        applicationCoordinator?.start()

        window.makeKeyAndVisible()
        return true
    }

    private func launchModules() {
        moduleLauncher.start()
    }
}
