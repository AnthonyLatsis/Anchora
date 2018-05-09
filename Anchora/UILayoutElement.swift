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
            self.topAnchor.constraint(equalTo: element.topAnchor, constant: top).isActive = true
        }
        if let left = insets.left {
            self.leftAnchor.constraint(equalTo: element.leftAnchor, constant: left).isActive = true
        }
        if let right = insets.right {
            self.rightAnchor.constraint(equalTo: element.rightAnchor, constant: -right).isActive = true
        }
        if let bottom = insets.bottom {
            self.bottomAnchor.constraint(equalTo: element.bottomAnchor, constant: -bottom).isActive = true
        }
    }

    public func center(in element: UILayoutElement, multipliers m: (CGFloat, CGFloat) = (1, 1)) {
    
        self.centerXAnchor.constraint(.equal, to: element.centerXAnchor, multiplier: m.0, constant: 0).activate()
        self.centerYAnchor.constraint(.equal, to: element.centerYAnchor, multiplier: m.1, constant: 0).activate()
    }
}

extension UIView: UILayoutElement {}

extension UILayoutGuide: UILayoutElement {}
    

