//
//  Fonts.swift
//  CombineTest
//
//  Created by Edouard Siegel on 03/03/16.
//
//

import UIKit
import ADUtils

extension UIFont {

    class func ad_mainFont(for textStyle: UIFont.TextStyle) -> UIFont {
        return FontHelper.shared.helveticaNeueDynamicFont.font(forTextStyle: textStyle)
    }
}

private class FontHelper {

    static let shared = FontHelper()

    let helveticaNeueDynamicFont: DynamicFont = {
        do {
            return try DynamicFont(fontName: "HelveticaNeue")
        } catch {
            assertionFailure("Unable to create helveticaNeueDynamicFont")
            return DynamicFont()
        }
    }()
}
