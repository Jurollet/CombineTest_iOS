//
//  TestPromisesPresenter.swift
//  CombineTest
//
//  Created by Julien Rollet on 26/11/2019.
//

import Foundation
import MapKit

protocol TestPromisesPresenter {
    func start()
    func updateRegion(_ region: MKMapRect)
}
