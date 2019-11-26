//
//  BuildingsRepositoryImplementation.swift
//  CombineTest
//
//  Created by Julien Rollet on 26/11/2019.
//

import Foundation
import MapKit
import PromiseKit

class BuildingsRepositoryImplementation: BuildingsRepository {

    func getBuildings(in region: MKCoordinateRegion) -> Promise<[Building]> {
        let restObject = RestBuilding(gid: 1, type: "Immeuble")
        return Promise.value([restObject.toEntity])
    }
}
