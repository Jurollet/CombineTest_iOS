//
//  TestPromisesViewController.swift
//  CombineTest
//
//  Created by Julien Rollet on 26/11/2019.
//

import Foundation
import MapKit

class TestPromisesViewController: SharedViewController,
    TestPromisesViewContract,
    MKMapViewDelegate {

    private lazy var mapView: MKMapView = {
        let view = MKMapView()
        view.delegate = self
        return view
    }()
    private lazy var buildingsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .ct_primary
        label.text = "Setup"
        return label
    }()

    var presenter: TestPromisesPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.start()
    }

    // MARK: - TestPromisesViewContract

    func showUserLocation() {
        mapView.showsUserLocation = true
        let origin = MKMapPoint(x: 137818281.17102566, y: 95752837.39263496)
        let size = MKMapSize(width: 10118.759387165308, height: 18917.680628448725)
        mapView.setVisibleMapRect(MKMapRect(origin: origin, size: size), animated: false)
    }

    // MARK: - MKMapViewDelegate

    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        presenter?.updateRegion(mapView.visibleMapRect)
    }

    // MARK: - Private

    private func setupView() {
        view.addSubview(mapView)
        mapView.ad_pinToSuperview()
        view.addSubview(buildingsLabel)
        buildingsLabel.translatesAutoresizingMaskIntoConstraints = false
        buildingsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buildingsLabel.centerYAnchor
            .constraint(equalTo: view.centerYAnchor, constant: 160)
            .isActive = true
    }
}
