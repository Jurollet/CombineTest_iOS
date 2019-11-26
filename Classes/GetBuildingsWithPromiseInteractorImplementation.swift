//
//  GetBuildingsWithPromiseInteractorImplementation.swift
//  CombineTest
//
//  Created by Julien Rollet on 26/11/2019.
//

import Foundation
import MapKit
import PromiseKit

class GetBuildingsWithPromiseInteractorImplementation: GetBuildingsWithPromiseInteractor {

    private let buildingsRepository: BuildingsRepository

    init(buildingsRepository: BuildingsRepository) {
        self.buildingsRepository = buildingsRepository
    }

    func execute(with region: MKCoordinateRegion) -> Promise<[Building]> {
        return buildingsRepository.getBuildings(in: region)
    }
}
