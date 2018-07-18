//
//  UILayoutElement.swift
//  Laser Nya
//
//  Created by Anthony Latsis on 18.11.16.
//  Copyright © 2016 Anthony Latsis. All rights reserved.
//

import UIKit

public protocol UILayoutElement {

    var bottomAnchor: NSLayoutYAxisAnchor {get}

    var centerXAnchor: NSLayoutXAxisAnchor {get}

    var centerYAnchor: NSLayoutYAxisAnchor {get}

    var heightAnchor: NSLayoutDimension {get}

    var leadingAnchor: NSLayoutXAxisAnchor {get}

    var leftAnchor: NSLayoutXAxisAnchor {get}

    var rightAnchor: NSLayoutXAxisAnchor {get}

    var topAnchor: NSLayoutYAxisAnchor {get}

    var trailingAnchor: NSLayoutXAxisAnchor {get}

    var widthAnchor: NSLayoutDimension {get}
}

public extension UILayoutElement {

    public var centerAnchors: AnchoraAnchorPair<NSLayoutXAxisAnchor, NSLayoutYAxisAnchor> {

        return AnchoraAnchorPair.init(self.centerXAnchor, self.centerYAnchor)
    }

    public var sizeAnchors: AnchoraAnchorPair<NSLayoutDimension, NSLayoutDimension> {

        return AnchoraAnchorPair.init(self.widthAnchor, self.heightAnchor)
    }

    public var leftRightAnchors: AnchoraAnchorPair<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {

        return AnchoraAnchorPair.init(self.leftAnchor, self.rightAnchor)
    }

    public var leadTrailAnchors: AnchoraAnchorPair<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {

        return AnchoraAnchorPair.init(self.leadingAnchor, self.trailingAnchor)
    }

    public var verticalAnchors: AnchoraAnchorPair<NSLayoutYAxisAnchor, NSLayoutYAxisAnchor> {

        return AnchoraAnchorPair.init(self.topAnchor, self.bottomAnchor)
    }

    public var edgeAnchors: AnchoraEdgeAnchors {

        return AnchoraEdgeAnchors.init(self.topAnchor, self.leftAnchor, self.bottomAnchor, self.rightAnchor)
    }

    public typealias Insets = (top: CGFloat?, left: CGFloat?, bottom: CGFloat?, right: CGFloat?)

    public func anchor(to element: UILayoutElement, insets: Insets = (0, 0, 0, 0)) {

        if let top = insets.top {
            topAnchor.equals(element.topAnchor + top)
        }
        if let left = insets.left {
            leftAnchor.equals(element.leftAnchor + left)
        }
        if let right = insets.right {
            rightAnchor.equals(element.rightAnchor - right)
        }
        if let bottom = insets.bottom {
            bottomAnchor.equals(element.bottomAnchor - bottom)
        }
    }
}

extension UIView: UILayoutElement {}
extension UILayoutGuide: UILayoutElement {}
    

