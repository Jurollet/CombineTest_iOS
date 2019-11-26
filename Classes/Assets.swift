//
//  ImagesAssets.swift
//
//  Created by Denis Poifol on 08/07/18.
//
//

import Foundation
import UIKit

public typealias Image = UIImage
public typealias Color = UIColor

// swiftlint:disable all
public extension Color {
  static let ct_background = _Asset.Colors.background.color
  static let ct_primary = _Asset.Colors.primary.color
}

public extension Image {
  static let ct_launchScreen = _Asset.Images.launchScreen.image
}

private enum _Asset {
// Hint: to name 2 resources with the same name in different folders without colision,
// check "Provides Namespace" in the xcasset folder attributes
  enum Colors {
    static let background = _ColorAsset(name: "Background")
    static let primary = _ColorAsset(name: "Primary")
  }
  enum Images {
    static let launchScreen = _ImageAsset(name: "LaunchScreen")
  }
}

private struct _ImageAsset {
  var name: String

  var image: Image {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else { fatalError("Unable to load image named \(name).") }
    return result
  }
}

private struct _ColorAsset {
  fileprivate(set) var name: String

  var color: Color {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    let color = Color(named: name, in: bundle, compatibleWith: nil)
    #elseif os(watchOS)
    let color = Color(named: name)
    #endif
    guard let result = color else { fatalError("Unable to load color named \(name).") }
    return result
  }
}


private extension Image {
  @available(iOS 1.0, tvOS 1.0, watchOS 1.0, *)
  convenience init!(asset: _ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = Bundle(for: BundleToken.self)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

private final class BundleToken {}
