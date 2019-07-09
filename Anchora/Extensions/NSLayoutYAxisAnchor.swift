//
//  NSLayoutYAxisAnchor.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/8/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit


public extension NSLayoutYAxisAnchor {
    @discardableResult
    func equals<T: AnchoraSingleContextRepresentable>(_ object: T)
        -> NSLayoutConstraint where T.AnchorType == NSLayoutYAxisAnchor, T.RelationType == LayoutDefaultRelation {
        return Anchora.constraint(self, object.context()).active()
    }

    @discardableResult
    func lessOrEquals<T: AnchoraSingleContextRepresentable>(_ object: T)
        -> NSLayoutConstraint where T.AnchorType == NSLayoutYAxisAnchor, T.RelationType == LayoutDefaultRelation {

        let context = object.context()
        context.constraints.relation = .lessThanOrEqual

        return Anchora.constraint(self, context).active()
    }

    @discardableResult
    func greaterOrEquals<T: AnchoraSingleContextRepresentable>(_ object: T)
        -> NSLayoutConstraint where T.AnchorType == NSLayoutYAxisAnchor, T.RelationType == LayoutDefaultRelation {

        let context = object.context()
        context.constraints.relation = .greaterThanOrEqual

        return Anchora.constraint(self, context).active()
    }
}

extension NSLayoutYAxisAnchor: AnchoraSingleContextRepresentable {
    public func context() -> AnchoraSingleContext<NSLayoutYAxisAnchor, LayoutDefaultRelation> {

        return AnchoraSingleContext(
            constraints: AnchoraConstraintContext(anchor: self))
    }
}



