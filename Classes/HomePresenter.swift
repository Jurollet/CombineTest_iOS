//
//  HomePresenter.swift
//  CombineTest
//
//  Created by Julien Rollet on 26/11/2019.
//

import Foundation

protocol HomePresenterDelegate: class {
    func homePresenterDidSelectPromises(_ presenter: HomePresenter)
    func homePresenterDidSelectCombine(_ presenter: HomePresenter)
}

protocol HomePresenter {
    func selectPromises()
    func selectCombine()
}
