//
//  BuildingsRepository.swift
//  CombineTest
//
//  Created by Julien Rollet on 26/11/2019.
//

import Foundation
import MapKit
import PromiseKit

protocol BuildingsRepository {
    func getBuildings(in region: MKCoordinateRegion) -> Promise<[Building]>
}
