//
//  ViewStyle+Initialization.swift
//  CombineTest
//
//  Created by Pierre Felgines on 16/01/2019.
//

import Foundation

extension ViewStylable where Self: UIView {
    init(style: ViewStyle<Self>) {
        self.init()
        applyStyle(style)
    }
}
