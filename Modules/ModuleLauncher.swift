//
//  ModuleLauncher.swift
//  CombineTest
//
//  Created by Gaétan Zanella on 31/07/2019.
//

import Foundation
import ADUtils

class ModuleLauncher {

    private let logger: Logger
    private let toolKit: DebugToolKit
    private let crashReporter: CrashReporter
    private let mainThreadMonitor: MainThreadMonitor
    private let proxyDetector: ProxyDetector

    // MARK: - Life Cycle

    init(logger: Logger,
         toolKit: DebugToolKit,
         crashReporter: CrashReporter,
         mainThreadMonitor: MainThreadMonitor,
         proxyDetector: ProxyDetector) {
        self.logger = logger
        self.toolKit = toolKit
        self.crashReporter = crashReporter
        self.mainThreadMonitor = mainThreadMonitor
        self.proxyDetector = proxyDetector
    }

    // MARK: - Public

    func start() {
        setUpLogger()
        setUpToolKit()
        setUpCrashReporter()
        setUpMainThreadMonitor()
        setUpProxyDetector()
    }

    // MARK: - Private

    private func setUpLogger() {
        logger.setup(
            logLevel: TargetSettings.shared.ddLogLevel,
            useFileLogger: TargetSettings.shared.useFileLogger
        )
    }

    private func setUpToolKit() {
        DebugToolKit().setup()
    }

    private func setUpCrashReporter() {
        guard !TargetSettings.shared.hockeyAppId.isEmpty else { return }
        crashReporter.setUp(usesFileLogger: TargetSettings.shared.useFileLogger)
    }

    private func setUpMainThreadMonitor() {
        guard TargetSettings.shared.useWatchdog else { return }
        mainThreadMonitor.setUp()
    }

    private func setUpProxyDetector() {
        guard TargetSettings.shared.useProxyDetector else { return }
            //???: (Benjamin Lavialle) 2017-10-10 Delay proxy notification to let
            // the application setup its view controllers
        proxyDetector.handleProxyNotification(after: 2.0)
    }
}
