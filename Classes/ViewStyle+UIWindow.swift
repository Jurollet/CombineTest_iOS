//
//  ViewStyle+UIWindow.swift
//  CombineTest
//
//  Created by Gaétan Zanella on 09/08/2019.
//

import UIKit

extension ViewStyle where T == UIWindow {

    static var main: ViewStyle<UIWindow> {
        return ViewStyle {
            $0.tintColor = .ct_primary
            $0.backgroundColor = .ct_background
        }
    }
}
