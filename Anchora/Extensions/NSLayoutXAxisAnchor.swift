//
//  NSLayoutXAxisAnchor.swift
//  ShapeIt
//
//  Created by Anthony Latsis on 2/8/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit

// MARK: METHODS WITH IMPLICIT RELATION

public extension NSLayoutXAxisAnchor {
    
    @discardableResult public func constraint<T: AnchoraSingleContextRepresentable>(_ object: T) -> NSLayoutConstraint where T.AnchorType == NSLayoutXAxisAnchor {
        
        let constr = object.context().constraints
        
        return self.constraint(constr.relation, to: constr.anchor!, multiplier: constr.multiplier, constant: constr.constant)
    }
    
    public func constrain<T: AnchoraSingleContextRepresentable>(_ object: T) where T.AnchorType == NSLayoutXAxisAnchor {
        
        self.constraint(object).activate()
    }
}

// MARK: CONSTRAINT ACTIVATING METHODS

public extension NSLayoutXAxisAnchor {
    
    public func equals<T: AnchoraSingleContextRepresentable>(_ object: T) where T.AnchorType == NSLayoutXAxisAnchor, T.RelationType == LayoutDefaultRelation {
        
        self.constrain(object)
    }
    
    public func lessOrEquals<T: AnchoraSingleContextRepresentable>(_ object: T) where T.AnchorType == NSLayoutXAxisAnchor, T.RelationType == LayoutDefaultRelation {
        
        let context = object.context()
        
        context.constraints.relation = .lessThanOrEqual
        
        self.constrain(context)
    }
    
    public func greaterOrEquals<T: AnchoraSingleContextRepresentable>(_ object: T) where T.AnchorType == NSLayoutXAxisAnchor, T.RelationType == LayoutDefaultRelation {
        
        let context = object.context()
        
        context.constraints.relation = .greaterThanOrEqual
        
        self.constrain(context)
    }
}

extension NSLayoutXAxisAnchor: AnchoraSingleContextRepresentable {
    
    public func context() -> AnchoraSingleContext<NSLayoutXAxisAnchor, LayoutDefaultRelation> {
        
        return AnchoraSingleContext.init(constraints: AnchoraConstraintContext.init(anchor: self))
    }
}

