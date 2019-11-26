//
//  ModuleAssembly.swift
//  CombineTest
//
//  Created by Gaétan Zanella on 31/07/2019.
//

import ADUtils
import Swinject

class ModuleAssembly: Assembly {

    func assemble(container: Container) {

        container.register(ModuleLauncher.self) { r in
            ModuleLauncher(
                logger: r.resolve(Logger.self)!,
                toolKit: r.resolve(DebugToolKit.self)!,
                crashReporter: r.resolve(CrashReporter.self)!,
                mainThreadMonitor: r.resolve(MainThreadMonitor.self)!,
                proxyDetector: r.resolve(ProxyDetector.self)!
            )
        }

        container.register(Logger.self) { _ in
            Logger()
        }.inObjectScope(.container)

        container.register(DebugToolKit.self) { _ in
            DebugToolKit()
        }

        container.register(CrashReporter.self) { r in
            CrashReporter(logger: r.resolve(Logger.self)!)
        }

        container.register(MainThreadMonitor.self) { r in
            MainThreadMonitor()
        }

        container.register(ProxyDetector.self) { r in
            ProxyDetector()
        }
    }
}
