// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let onBoarding2 = ImageAsset(name: "OnBoarding2")
  internal static let onBoarding3 = ImageAsset(name: "OnBoarding3 ")
  internal static let onBoarding1 = ImageAsset(name: "onBoarding1")
  internal static let accentColor = ColorAsset(name: "AccentColor")
  internal static let lauchScreen1x = ImageAsset(name: "LauchScreen (1x)")
  internal static let launchingCuate2 = ImageAsset(name: "Launching-cuate 2 ")
  internal static let icArrow = ImageAsset(name: "ic_arrow")
  internal static let icBasket = ImageAsset(name: "ic_basket")
  internal static let icGrayAboutService = ImageAsset(name: "ic_gray_about_service")
  internal static let icGrayHeart = ImageAsset(name: "ic_gray_heart")
  internal static let icGrayMyOrders = ImageAsset(name: "ic_gray_my_orders")
  internal static let icGrayUser = ImageAsset(name: "ic_gray_user")
  internal static let icInstPlaceholder = ImageAsset(name: "ic_inst_placeholder")
  internal static let icNavEmLogo = ImageAsset(name: "ic_nav_em_logo")
  internal static let icSelectDiscount = ImageAsset(name: "ic_select_discount")
  internal static let icSelectHome = ImageAsset(name: "ic_select_home")
  internal static let icSelectSearch = ImageAsset(name: "ic_select_search")
  internal static let icUnselectCabinet = ImageAsset(name: "ic_unselect_cabinet")
  internal static let icUnselectDiscount = ImageAsset(name: "ic_unselect_discount")
  internal static let icUnselectSearch = ImageAsset(name: "ic_unselect_search")
  internal static let icUnselectedHome = ImageAsset(name: "ic_unselected_home")
  internal static let icons8Dyndns64 = ImageAsset(name: "icons8-dyndns-64")
  internal static let image112 = ImageAsset(name: "image112")
  internal static let loginPage = ImageAsset(name: "loginPage")
  internal static let sunriseGroup1x = ImageAsset(name: "sunriseGroup (1x)")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
}

internal extension ImageAsset.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
