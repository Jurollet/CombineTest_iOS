//
//  ViewController.swift
//  CombineTest
//
//  Created by Edouard Siegel on 03/03/16.
//
//

import UIKit

class SharedViewController: UIViewController {

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("Unavailable")
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}
