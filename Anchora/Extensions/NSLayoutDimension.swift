//
//  NSLayoutDimension.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/8/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//


@nonobjc public extension NSLayoutDimension {
    @discardableResult
    func equals<T: AnchoraSingleContextRepresentable>(_ object: T)
        -> NSLayoutConstraint where T.AnchorType == NSLayoutDimension, T.RelationType == LayoutDefaultRelation {
        return Anchora.constraint(self, object.context()).active()
    }

    @discardableResult
    func lessOrEquals<T: AnchoraSingleContextRepresentable>(_ object: T)
        -> NSLayoutConstraint where T.AnchorType == NSLayoutDimension, T.RelationType == LayoutDefaultRelation {

        let context = object.context()
        context.constraints.relation = .lessThanOrEqual

        return Anchora.constraint(self, context).active()
    }

    @discardableResult
    func greaterOrEquals<T: AnchoraSingleContextRepresentable>(_ object: T)
        -> NSLayoutConstraint where T.AnchorType == NSLayoutDimension, T.RelationType == LayoutDefaultRelation {

        let context = object.context()
        context.constraints.relation = .greaterThanOrEqual

        return Anchora.constraint(self, context).active()
    }
}

extension NSLayoutDimension: AnchoraSingleContextRepresentable {
    public func context() -> AnchoraSingleContext<NSLayoutDimension, LayoutDefaultRelation> {

        return AnchoraSingleContext(
            constraints: AnchoraConstraintContext(anchor: self))
    }
}
