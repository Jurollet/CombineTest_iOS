//
//  RepositoryAssembly.swift
//  CombineTest
//
//  Created by Pierre Felgines on 30/11/16.
//
//

import Foundation
import Swinject

class RepositoryAssembly: Assembly {

    func assemble(container: Container) {
        container.register(BuildingsRepository.self) { _ in
            BuildingsRepositoryImplementation()
        }
    }
}
