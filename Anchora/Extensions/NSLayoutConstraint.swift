//
//  NSLayoutConstraint.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/10/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//


internal extension NSLayoutConstraint {
    func with(m: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: firstItem as Any, attribute: firstAttribute,
            relatedBy: relation, toItem: secondItem,
            attribute: secondAttribute, multiplier: m, constant: constant)
    }
}

public extension NSLayoutConstraint {
    func activate() { isActive = true }

    internal func active() -> NSLayoutConstraint {
        isActive = true
        return self
    }

    func inactive() -> NSLayoutConstraint {
        isActive = false
        return self
    }
}
