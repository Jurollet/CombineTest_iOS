//
//  SharedTabBarController.swift
//  CombineTest
//
//  Created by Pierre Felgines on 12/09/2017.
//
//

import Foundation
import UIKit

class SharedTabBarController: UITabBarController {

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        if let viewController = selectedViewController {
            return viewController.preferredInterfaceOrientationForPresentation
        }
        return super.preferredInterfaceOrientationForPresentation
    }

    override var shouldAutorotate: Bool {
        if let viewController = selectedViewController {
            return viewController.shouldAutorotate
        }
        return super.shouldAutorotate
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if let viewController = selectedViewController {
            return viewController.supportedInterfaceOrientations
        }
        return super.supportedInterfaceOrientations
    }
}
