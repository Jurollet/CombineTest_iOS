//
//  SharedNavigationController.swift
//  CombineTest
//
//  Created by Pierre Felgines on 12/09/2017.
//
//

import Foundation
import UIKit

class SharedNavigationController: UINavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        if let viewController = topViewController {
            return viewController.preferredStatusBarStyle
        }
        return super.preferredStatusBarStyle
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        if let viewController = topViewController {
            return viewController.preferredInterfaceOrientationForPresentation
        }
        return super.preferredInterfaceOrientationForPresentation
    }

    override var shouldAutorotate: Bool {
        if let viewController = topViewController {
            return viewController.shouldAutorotate
        }
        return super.shouldAutorotate
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if let viewController = topViewController {
            return viewController.supportedInterfaceOrientations
        }
        return super.supportedInterfaceOrientations
    }
}
