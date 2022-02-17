//
//  ImageViewExtensions.swift
//  Hedef Bilsem
//
//  Created by Ahmet Ekti on 20.08.2020.
//  Copyright © 2020 freelancer.istanbul.hedefbilsem. All rights reserved.
//

import UIKit

// MARK: V0.0.5 Eklendi
#if os(OSX)
import AppKit.NSImage
internal typealias AssetColorTypeAlias = NSColor
internal typealias AssetImageTypeAlias = NSImage
#elseif os(iOS) || os(tvOS) || os(watchOS)
import UIKit.UIImage
internal typealias AssetColorTypeAlias = UIColor
internal typealias AssetImageTypeAlias = UIImage
#endif

internal struct ImageAsset {
    internal fileprivate(set) var name: String
    
    internal var image: AssetImageTypeAlias {
        let bundle = Bundle(for: BundleToken.self)
        #if os(iOS) || os(tvOS)
        let image = AssetImageTypeAlias(named: name, in: bundle, compatibleWith: nil)
        #elseif os(OSX)
        let image = bundle.image(forResource: name)
        #elseif os(watchOS)
        let image = AssetImageTypeAlias(named: name)
        #endif
        guard let result = image else { fatalError("Unable to load image named \(name).") }
        return result
    }
}

internal extension AssetImageTypeAlias {
    @available(iOS 1.0, tvOS 1.0, watchOS 1.0, *)
    @available(OSX, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
    convenience init!(asset: ImageAsset) {
        #if os(iOS) || os(tvOS)
        let bundle = Bundle(for: BundleToken.self)
        self.init(named: asset.name, in: bundle, compatibleWith: nil)
        #elseif os(OSX) || os(watchOS)
        self.init(named: asset.name)
        #endif
    }
}

private final class BundleToken {}


// MARK: V0.0.3 Eklendi
extension UIImage { //Resmi resize eder.
    func resized(maxSize: CGFloat) -> UIImage? {
        let scale: CGFloat
        if size.width > size.height {
            scale = maxSize / size.width
        }
        else {
            scale = maxSize / size.height
        }
        
        let newWidth = size.width * scale
        let newHeight = size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}

// MARK: V0.0.6 Düzenlendi
extension UIView {
    func makeRounded(borderColor : UIColor = .black , borderWidth : CGFloat = 1, isBorder : Bool = false) {
    
        self.layer.masksToBounds = false
        
        if isBorder{
            self.layer.borderColor = borderColor.cgColor
            self.layer.borderWidth = borderWidth
        }

        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}

// MARK: V0.0.6 Eklendi
public enum ImageFormat {
    case png
    case jpeg(CGFloat)
}

// MARK: V0.0.6 Eklendi
func convertImageTobase64(format: ImageFormat, image:UIImage) -> String? {
 
    var imageData: Data?
    switch format {
    case .png: imageData = image.pngData()
    case .jpeg(let compression): imageData = image.jpegData(compressionQuality: compression)
    }
    return imageData?.base64EncodedString()
}

// MARK: V0.0.6 YENİ EKLENDİ
extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}


// MARK: V0.0.6 Eklendi
extension UIImage {
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }

    /// Returns the data for the specified image in JPEG format.
    /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
    /// - returns: A data object containing the JPEG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
    func jpeg(_ jpegQuality: JPEGQuality) -> Data? {
        return jpegData(compressionQuality: jpegQuality.rawValue)
    }
}
