//
//  TestCombinePresenter.swift
//  CombineTest
//
//  Created by Julien Rollet on 26/11/2019.
//

import Foundation
import MapKit

protocol TestCombinePresenter {
    func start()
    func updateRegion(_ region: MKMapRect)
}
