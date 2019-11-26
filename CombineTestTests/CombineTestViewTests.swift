//
//  CombineTestTests.swift
//  CombineTestTests
//
//  Created by Pierre Felgines on 12/05/16.
//
//

import XCTest
import ADLayoutTest
import SwiftCheck
import SnapshotTesting
@testable import CombineTest

struct ViewControllerViewModel {
    let title: String?
}

extension ViewControllerViewModel: Arbitrary {

    public static var arbitrary: Gen<ViewControllerViewModel> {
        return Gen<ViewControllerViewModel>.compose { c in
            return ViewControllerViewModel(title: c.generate(using: .words))
        }
    }
}

class CombineTestViewTests: XCTestCase {

    private enum Constant {
        static let DefaultTestCount = 5
    }

    // There is no recorded snapshots on the Templater, this means tests fail at first launch
    // You probably want to remove that test and its associated view model when you start implementing tests

    func testExampleSharedViewController() {
        runLayoutTests(
            named: "SharedNavigationController title",
            randomStrategy: .consistent,
            maxTestsCount: Constant.DefaultTestCount
        ) { (viewModel: ViewControllerViewModel) in
            let viewController = SharedViewController()
            viewController.title = viewModel.title
            let navigationController = SharedNavigationController(rootViewController: viewController)
            assertSnapshot(
                matching: navigationController,
                as: .image(on: .iPhoneSe)
            )
            return .success
        }
    }
}
