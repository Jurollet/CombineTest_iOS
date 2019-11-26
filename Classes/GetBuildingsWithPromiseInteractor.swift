//
//  GetBuildingsWithPromiseInteractor.swift
//  CombineTest
//
//  Created by Julien Rollet on 26/11/2019.
//

import Foundation
import MapKit
import PromiseKit

protocol GetBuildingsWithPromiseInteractor {
    func execute(with region: MKCoordinateRegion) -> Promise<[Building]>
}
