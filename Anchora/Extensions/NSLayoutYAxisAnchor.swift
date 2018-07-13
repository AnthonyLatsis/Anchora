//
//  NSLayoutYAxisAnchor.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/8/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit


public extension NSLayoutYAxisAnchor {

    @discardableResult public func constraint<T: AnchoraSingleContextRepresentable>(_ object: T) -> NSLayoutConstraint where T.AnchorType == NSLayoutYAxisAnchor {

        let constr = object.context().constraints

        return self.constraint(constr.relation, to: constr.anchor!, multiplier: constr.multiplier, constant: constr.constant)
    }
}


public extension NSLayoutYAxisAnchor {
    
    public func equals<T: AnchoraSingleContextRepresentable>(_ object: T) where T.AnchorType == NSLayoutYAxisAnchor, T.RelationType == LayoutDefaultRelation {

        self.constraint(object).activate()
    }

    public func lessOrEquals<T: AnchoraSingleContextRepresentable>(_ object: T) where T.AnchorType == NSLayoutYAxisAnchor, T.RelationType == LayoutDefaultRelation {

        let context = object.context()

        context.constraints.relation = .lessThanOrEqual
        self.constraint(object).activate()
    }

    public func greaterOrEquals<T: AnchoraSingleContextRepresentable>(_ object: T) where T.AnchorType == NSLayoutYAxisAnchor, T.RelationType == LayoutDefaultRelation {

        let context = object.context()

        context.constraints.relation = .greaterThanOrEqual
        self.constraint(object).activate()
    }
}

extension NSLayoutYAxisAnchor: AnchoraSingleContextRepresentable {

    public func context() -> AnchoraSingleContext<NSLayoutYAxisAnchor, LayoutDefaultRelation> {

        return AnchoraSingleContext.init(constraints: AnchoraConstraintContext.init(anchor: self))
    }
}


