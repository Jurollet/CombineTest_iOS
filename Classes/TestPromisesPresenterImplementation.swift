//
//  TestPromisesPresenterImplementation.swift
//  CombineTest
//
//  Created by Julien Rollet on 26/11/2019.
//

import Foundation
import MapKit

class TestPromisesPresenterImplementation: TestPromisesPresenter {

    private lazy var locationManager = CLLocationManager()

    private weak var viewContract: TestPromisesViewContract?

    init(viewContract: TestPromisesViewContract) {
        self.viewContract = viewContract
    }

    // MARK: - TestPromisesPresenter

    func start() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            viewContract?.showUserLocation()
        } else {
          locationManager.requestWhenInUseAuthorization()
        }
    }

    func updateRegion(_ region: MKMapRect) {
        print("\(region)")
    }
}
