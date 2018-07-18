//
//  NSLayoutAnchor.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/13/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit

internal extension NSLayoutAnchor {

    @objc func constraint(_ relation: NSLayoutRelation = .equal, to anchor: NSLayoutAnchor<AnchorType>?, multiplier m: CGFloat, constant c: CGFloat) -> NSLayoutConstraint {

        if let anchor = anchor {
            switch relation {
            case .equal:
                return self.constraint(equalTo: anchor, constant: c).with(m: m)
            case .lessThanOrEqual:
                return self.constraint(lessThanOrEqualTo: anchor, constant: c).with(m: m)
            case .greaterThanOrEqual:
                return self.constraint(greaterThanOrEqualTo: anchor, constant: c).with(m: m)
            }
        }
        if let dimension = self as? NSLayoutDimension {
            switch relation {
            case .equal: return dimension.constraint(equalToConstant: c)
            case .lessThanOrEqual: return dimension.constraint(lessThanOrEqualToConstant: c)
            case .greaterThanOrEqual: return dimension.constraint(greaterThanOrEqualToConstant: c)
            }
        }
        fatalError("Neither a NSLayoutDimension nor NSLayoutAxisAnchor?")
    }
}

internal func constraint<A, T: AnchoraSingleContextRepresentable>(_ anchor: NSLayoutAnchor<A>, _ object: T) -> NSLayoutConstraint where T.AnchorType == A {

    let constr = object.context().constraints

    return anchor.constraint(constr.relation, to: constr.anchor, multiplier: constr.multiplier, constant: constr.constant)
}



