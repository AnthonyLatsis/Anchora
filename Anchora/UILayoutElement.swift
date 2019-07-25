//
//  UILayoutElement.swift
//  Laser Nya
//
//  Created by Anthony Latsis on 18.11.16.
//  Copyright © 2016 Anthony Latsis. All rights reserved.
//

import UIKit.UIView

public enum XAxisKind {

    case leadTrail
    
    case leftRight
}

public protocol UILayoutElement {

    var leadingAnchor: NSLayoutXAxisAnchor { get }

    var trailingAnchor: NSLayoutXAxisAnchor { get }

    var leftAnchor: NSLayoutXAxisAnchor { get }

    var rightAnchor: NSLayoutXAxisAnchor { get }

    var topAnchor: NSLayoutYAxisAnchor { get }

    var bottomAnchor: NSLayoutYAxisAnchor { get }

    var widthAnchor: NSLayoutDimension { get }

    var heightAnchor: NSLayoutDimension { get }

    var centerXAnchor: NSLayoutXAxisAnchor { get }

    var centerYAnchor: NSLayoutYAxisAnchor { get }
}

public extension UILayoutElement {
    var centerAnchors: AnchoraAnchorPair<NSLayoutXAxisAnchor, NSLayoutYAxisAnchor> {

        return AnchoraAnchorPair(centerXAnchor, centerYAnchor)
    }

    var sizeAnchors: AnchoraAnchorPair<NSLayoutDimension, NSLayoutDimension> {
        return AnchoraAnchorPair(widthAnchor, heightAnchor)
    }

    var leftRightAnchors: AnchoraAnchorPair<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
        return AnchoraAnchorPair(leftAnchor, rightAnchor)
    }

    var leadTrailAnchors: AnchoraAnchorPair<NSLayoutXAxisAnchor, NSLayoutXAxisAnchor> {
        return AnchoraAnchorPair(leadingAnchor, trailingAnchor)
    }

    var verticalAnchors: AnchoraAnchorPair<NSLayoutYAxisAnchor, NSLayoutYAxisAnchor> {
        return AnchoraAnchorPair(topAnchor, bottomAnchor)
    }

    var edgeAnchors: AnchoraEdgeAnchors {
        return AnchoraEdgeAnchors(topAnchor, leftAnchor, bottomAnchor, rightAnchor)
    }

    typealias Insets = (top: CGFloat?, left: CGFloat?,
                        bottom: CGFloat?, right: CGFloat?)

    func anchor(to element: UILayoutElement,
                using axis: XAxisKind = .leadTrail,
                insets: Insets = (0, 0, 0, 0)) {

        if let top = insets.top {
            topAnchor.equals(element.topAnchor + top)
        }
        if let left = insets.left {
            if axis == .leadTrail {
                leadingAnchor.equals(element.leadingAnchor + left)
            } else {
                leftAnchor.equals(element.leftAnchor + left)
            }
        }
        if let right = insets.right {
            if axis == .leadTrail {
                trailingAnchor.equals(element.trailingAnchor - right)
            } else {
                rightAnchor.equals(element.rightAnchor - right)
            }
        }
        if let bottom = insets.bottom {
            bottomAnchor.equals(element.bottomAnchor - bottom)
        }
    }
}

extension UIView: UILayoutElement { }

extension UILayoutGuide: UILayoutElement { }

public extension UIView {

    func anchorToSuperview(using axis: XAxisKind = .leadTrail) {
        superview.map {
            anchor(to: $0, using: axis)
        }
    }
}
