//
//  Logger.swift
//  CombineTest
//
//  Created by Pierre Felgines on 13/06/16.
//
//

import Foundation
import CocoaLumberjack

class Logger {

    private lazy var fileLogger: DDFileLogger? = {
        let logger = DDFileLogger()
        logger.rollingFrequency = TimeInterval(2 * 60 * 60) // 2 hours
        logger.logFileManager.maximumNumberOfLogFiles = 1
        logger.doNotReuseLogFiles = true
        logger.logFormatter = ADFileLoggerFormatter()
        return logger
    }()

    func setup(logLevel: DDLogLevel, useFileLogger: Bool) {
        let xCodeConsoleLogger = DDTTYLogger.sharedInstance
        xCodeConsoleLogger?.colorsEnabled = true

        let appleSystemLogger = DDOSLogger.sharedInstance

        if let xCodeConsoleLogger = xCodeConsoleLogger {
            DDLog.add(xCodeConsoleLogger, with: logLevel)
        }
        if let appleSystemLogger = appleSystemLogger {
            DDLog.add(appleSystemLogger, with: logLevel)
        }

        if useFileLogger, let fileLogger = fileLogger {
            DDLog.add(fileLogger, with: DDLogLevel.all)
        }
    }

    func fileLogs() -> Data {
        var data = Data()
        fileLogger?.logFileManager.sortedLogFileInfos.forEach {
            if let fileData = NSData(contentsOfFile: $0.filePath) {
                data.append(fileData as Data)
            }
        }
        return data
    }
}
