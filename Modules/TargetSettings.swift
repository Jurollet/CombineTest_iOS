//
//  TargetSettings.swift
//  CombineTest
//
//  Created by Pierre Felgines on 22/09/16.
//
//

import Foundation

struct TargetSettings: Decodable {

    static var shared: TargetSettings = {
        let decoder = TargetSettingsDecoder()
        return decoder.decode()
    }()

    private var logLevel: Int = 0
    var hockeyAppId: String = ""
    var useWatchdog: Bool = false
    var useFileLogger: Bool = false
    var useProxyDetector: Bool = false

    // MARK: - Computed

    var ddLogLevel: DDLogLevel {
        let logLevels: [DDLogLevel] = [
            .off,
            .error,
            .warning,
            .info,
            .debug,
            .verbose,
            .all,
        ]
        guard logLevel >= 0 && logLevel < logLevels.count else {
            return .off
        }
        return logLevels[logLevel]
    }
}
