//
//  GetBuildingsWithCombineInteractor.swift
//  CombineTest
//
//  Created by Julien Rollet on 27/11/2019.
//

import Foundation
import MapKit
import Combine

class GetBuildingsWithCombineInteractor: CombineInteractor {

    private let buildingsRepository: BuildingsRepository

    init(buildingsRepository: BuildingsRepository) {
        self.buildingsRepository = buildingsRepository
    }

    func execute(_ region: MKCoordinateRegion) -> AnyPublisher<[Building], Error> {
        return buildingsRepository
            .getBuildings(in: region)
            .map {
                $0.filter {
                    $0.type == "Bâti léger"
                }
            }
            .eraseToAnyPublisher()
    }
}
