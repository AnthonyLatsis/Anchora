//
//  NSLayoutDimension.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/8/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit

internal extension NSLayoutDimension {

    internal func constraint(_ relation: NSLayoutRelation, constant c: CGFloat) -> NSLayoutConstraint {
        switch relation {
        case .equal: return self.constraint(equalToConstant: c)
        case .lessThanOrEqual: return self.constraint(lessThanOrEqualToConstant: c)
        case .greaterThanOrEqual: return self.constraint(greaterThanOrEqualToConstant: c)
        }
    }
}


public extension NSLayoutDimension {

    @discardableResult public func constraint<T: AnchoraSingleContextRepresentable>(_ object: T) -> NSLayoutConstraint where T.AnchorType == NSLayoutDimension {

        let constr = object.context().constraints

        if let anchor = constr.anchor {
            return self.constraint(constr.relation, to: anchor, multiplier: constr.multiplier, constant: constr.constant)
        }
        return self.constraint(constr.relation, constant: constr.constant)
    }
}


@nonobjc public extension NSLayoutDimension {

    @discardableResult public func equals<T: AnchoraSingleContextRepresentable>(_ object: T) -> NSLayoutConstraint where T.AnchorType == NSLayoutDimension, T.RelationType == LayoutDefaultRelation {

        return self.constraint(object).active()
    }

    @discardableResult public func lessOrEquals<T: AnchoraSingleContextRepresentable>(_ object: T) -> NSLayoutConstraint where T.AnchorType == NSLayoutDimension, T.RelationType == LayoutDefaultRelation {

        let context = object.context()

        context.constraints.relation = .lessThanOrEqual
        return self.constraint(object).active()
    }

    @discardableResult public func greaterOrEquals<T: AnchoraSingleContextRepresentable>(_ object: T) -> NSLayoutConstraint where T.AnchorType == NSLayoutDimension, T.RelationType == LayoutDefaultRelation {

        let context = object.context()

        context.constraints.relation = .greaterThanOrEqual
        return self.constraint(object).active()
    }
}

extension NSLayoutDimension: AnchoraSingleContextRepresentable {

    public func context() -> AnchoraSingleContext<NSLayoutDimension, LayoutDefaultRelation> {

        return AnchoraSingleContext.init(constraints: AnchoraConstraintContext.init(anchor: self))
    }
}
