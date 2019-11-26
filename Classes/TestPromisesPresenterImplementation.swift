//
//  TestPromisesPresenterImplementation.swift
//  CombineTest
//
//  Created by Julien Rollet on 26/11/2019.
//

import Foundation
import MapKit

class TestPromisesPresenterImplementation: TestPromisesPresenter {

    private let getBuildingsWithPromiseInteractor: GetBuildingsWithPromiseInteractor
    private lazy var locationManager = CLLocationManager()

    private weak var viewContract: TestPromisesViewContract?

    init(viewContract: TestPromisesViewContract,
         getBuildingsWithPromiseInteractor: GetBuildingsWithPromiseInteractor) {
        self.viewContract = viewContract
        self.getBuildingsWithPromiseInteractor = getBuildingsWithPromiseInteractor
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
        let coordinates = MKCoordinateRegion(region)
        _ = getBuildingsWithPromiseInteractor.execute(with: coordinates).done { [weak self] buildings in
            self?.viewContract?.showBuildingsCount(countString: "\(buildings.count)")
        }
    }
}
