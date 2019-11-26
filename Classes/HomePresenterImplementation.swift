//
//  HomePresenterImplementation.swift
//  CombineTest
//
//  Created by Julien Rollet on 26/11/2019.
//

import Foundation

class HomePresenterImplementation: HomePresenter {

    private weak var viewContract: HomeViewContract?
    private weak var delegate: HomePresenterDelegate?

    init(viewContract: HomeViewContract,
         delegate: HomePresenterDelegate) {
        self.viewContract = viewContract
        self.delegate = delegate
    }

    // MARK: - HomePresenter

    func selectPromises() {
        delegate?.homePresenterDidSelectPromises(self)
    }

    func selectCombine() {
        delegate?.homePresenterDidSelectCombine(self)
    }
}
