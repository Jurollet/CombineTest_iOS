//
//  CrashReporter.swift
//  CombineTest
//
//  Created by Gaétan Zanella on 31/07/2019.
//

import HockeySDK

class CrashReporter: NSObject, BITHockeyManagerDelegate {

    private let logger: Logger

    // MARK: - Life Cycle

    init(logger: Logger) {
        self.logger = logger
    }

    // MARK: - Public

    func setUp(usesFileLogger: Bool) {
        BITHockeyManager.shared().configure(withIdentifier: TargetSettings.shared.hockeyAppId)
        BITHockeyManager.shared().crashManager.crashManagerStatus = .autoSend
        BITHockeyManager.shared().crashManager.isAppNotTerminatingCleanlyDetectionEnabled = true
        if usesFileLogger {
            BITHockeyManager.shared().delegate = self
        }
        BITHockeyManager.shared().start()
    }

    // MARK: - BITHockeyManagerDelegate

    // swiftlint:disable:next implicitly_unwrapped_optional
    func attachment(for crashManager: BITCrashManager!) -> BITHockeyAttachment! {
        return BITHockeyAttachment(
            filename: "report",
            hockeyAttachmentData: logger.fileLogs(),
            contentType: "text/plain"
        )
    }
}
