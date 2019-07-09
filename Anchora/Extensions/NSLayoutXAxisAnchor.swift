//
//  NSLayoutXAxisAnchor.swift
//  ShapeIt
//
//  Created by Anthony Latsis on 2/8/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//


public extension NSLayoutXAxisAnchor {
    @discardableResult
    func equals<T: AnchoraSingleContextRepresentable>(_ object: T)
        -> NSLayoutConstraint where T.AnchorType == NSLayoutXAxisAnchor, T.RelationType == LayoutDefaultRelation {
        return Anchora.constraint(self, object.context()).active()
    }

    @discardableResult
    func lessOrEquals<T: AnchoraSingleContextRepresentable>(_ object: T)
        -> NSLayoutConstraint where T.AnchorType == NSLayoutXAxisAnchor, T.RelationType == LayoutDefaultRelation {
        let context = object.context()
        context.constraints.relation = .lessThanOrEqual

        return Anchora.constraint(self, context).active()
    }

    @discardableResult
    func greaterOrEquals<T: AnchoraSingleContextRepresentable>(_ object: T)
        -> NSLayoutConstraint where T.AnchorType == NSLayoutXAxisAnchor, T.RelationType == LayoutDefaultRelation {

        let context = object.context()
        context.constraints.relation = .greaterThanOrEqual
        return Anchora.constraint(self, context).active()
    }
}

extension NSLayoutXAxisAnchor: AnchoraSingleContextRepresentable {
    public func context() -> AnchoraSingleContext<NSLayoutXAxisAnchor, LayoutDefaultRelation> {

        return AnchoraSingleContext(constraints: AnchoraConstraintContext(anchor: self))
    }
}

