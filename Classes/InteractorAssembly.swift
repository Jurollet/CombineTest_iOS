//
//  InteractorAssembly.swift
//  CombineTest
//
//  Created by Pierre Felgines on 30/11/16.
//
//

import Foundation
import Swinject

class InteractorAssembly: Assembly {

    func assemble(container: Container) {
        container.register(GetBuildingsWithPromiseInteractor.self) { r in
            GetBuildingsWithPromiseInteractorImplementation(
                buildingsRepository: r.resolve(BuildingsRepository.self)!
            )
        }

        container.register(GetBuildingsWithCombineInteractor.self) { r in
            GetBuildingsWithCombineInteractor(
                buildingsRepository: r.resolve(BuildingsRepository.self)!
            )
        }
    }
}
