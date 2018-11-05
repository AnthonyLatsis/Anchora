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
                return constraint(equalTo: anchor, constant: c).with(m: m)
            case .lessThanOrEqual:
                return constraint(lessThanOrEqualTo: anchor, constant: c).with(m: m)
            case .greaterThanOrEqual:
                return constraint(greaterThanOrEqualTo: anchor, constant: c).with(m: m)
            }
        }
        guard let dimension = self as? NSLayoutDimension else {
             fatalError("Neither a NSLayoutDimension nor NSLayoutAxisAnchor?")
        }
        switch relation {
        case .equal: return dimension.constraint(equalToConstant: c)
        case .lessThanOrEqual: return dimension.constraint(lessThanOrEqualToConstant: c)
        case .greaterThanOrEqual: return dimension.constraint(greaterThanOrEqualToConstant: c)
        }
    }
}

internal func constraint<A>(_ anchor: NSLayoutAnchor<A>, _ context: AnchoraSingleContext<A, LayoutDefaultRelation>) -> NSLayoutConstraint {

    let constr = context.constraints

    return anchor.constraint(constr.relation, to: constr.anchor, multiplier: constr.multiplier, constant: constr.constant)
}



