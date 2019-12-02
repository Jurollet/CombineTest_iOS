//
//  TestCombinePresenterImplementation.swift
//  CombineTest
//
//  Created by Julien Rollet on 26/11/2019.
//

import Foundation
import MapKit
import Combine

class TestCombinePresenterImplementation: TestCombinePresenter {

    private let getBuildingsInteractor: GetBuildingsWithCombineInteractor
    private lazy var locationManager = CLLocationManager()

    private weak var viewContract: TestCombineViewContract?
    private var buildingsCancellable: AnyCancellable?

    init(viewContract: TestCombineViewContract,
         getBuildingsInteractor: GetBuildingsWithCombineInteractor) {
        self.viewContract = viewContract
        self.getBuildingsInteractor = getBuildingsInteractor
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
        buildingsCancellable?.cancel()
        let coordinates = MKCoordinateRegion(region)
        buildingsCancellable = getBuildingsInteractor
            .execute(coordinates)
            .catch { _ -> Just<[Building]> in
                return Just([])
            }
            .sink { [weak self] buildings in
                self?.viewContract?.showBuildingsCount(countString: "\(buildings.count)")
                self?.buildingsCancellable = nil
            }
    }
}
