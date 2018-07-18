//
//  NSLayoutXAxisAnchor.swift
//  ShapeIt
//
//  Created by Anthony Latsis on 2/8/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit


public extension NSLayoutXAxisAnchor {
    
    @discardableResult public func equals<T: AnchoraSingleContextRepresentable>(_ object: T) -> NSLayoutConstraint where T.AnchorType == NSLayoutXAxisAnchor, T.RelationType == LayoutDefaultRelation {

        return Anchora.constraint(self, object).active()
    }
    
    @discardableResult public func lessOrEquals<T: AnchoraSingleContextRepresentable>(_ object: T) -> NSLayoutConstraint where T.AnchorType == NSLayoutXAxisAnchor, T.RelationType == LayoutDefaultRelation {

        let context = object.context()

        context.constraints.relation = .lessThanOrEqual
        return Anchora.constraint(self, object).active()
    }
    
    @discardableResult public func greaterOrEquals<T: AnchoraSingleContextRepresentable>(_ object: T) -> NSLayoutConstraint where T.AnchorType == NSLayoutXAxisAnchor, T.RelationType == LayoutDefaultRelation {

        let context = object.context()

        context.constraints.relation = .greaterThanOrEqual
        return Anchora.constraint(self, object).active()
    }
}

extension NSLayoutXAxisAnchor: AnchoraSingleContextRepresentable {

    public func context() -> AnchoraSingleContext<NSLayoutXAxisAnchor, LayoutDefaultRelation> {

        return AnchoraSingleContext.init(constraints: AnchoraConstraintContext.init(anchor: self))
    }
}

