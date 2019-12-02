//
//  BuildingsRepository.swift
//  CombineTest
//
//  Created by Julien Rollet on 26/11/2019.
//

import Foundation
import MapKit
import PromiseKit
import Combine

protocol BuildingsRepository {
    func getBuildings(in region: MKCoordinateRegion) -> Promise<[Building]>
    func getBuildings(in region: MKCoordinateRegion) -> Future<[Building], Error>
}
