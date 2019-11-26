//
//  MainThreadMonitor.swift
//  CombineTest
//
//  Created by Gaétan Zanella on 31/07/2019.
//

import Watchdog

class MainThreadMonitor {

    var watchdog: Watchdog?

    func setUp() {
        watchdog = Watchdog(threshold: 0.2) {
            DDLogWarn("[Watchdog] Block main thread for over 0.2s")
        }
    }
}
