//
//  HomeViewController.swift
//  CombineTest
//
//  Created by Julien Rollet on 26/11/2019.
//

import Foundation

class HomeViewController: SharedViewController, HomeViewContract {

    var presenter: HomePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Private

    private func setupView() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        view.addSubview(stackView)
        stackView.ad_pinToSuperview()
        let promisesButton = UIButton()
        promisesButton.setTitle("Promises", for: .normal)
        promisesButton.addTarget(self, action: #selector(selectPromises), for: .touchUpInside)
        stackView.addArrangedSubview(promisesButton)
        let combineButton = UIButton()
        combineButton.setTitle("Combine", for: .normal)
        combineButton.addTarget(self, action: #selector(selectCombine), for: .touchUpInside)
        stackView.addArrangedSubview(combineButton)
    }

    @objc private func selectPromises() {
        presenter?.selectPromises()
    }

    @objc private func selectCombine() {
        presenter?.selectCombine()
    }
}
