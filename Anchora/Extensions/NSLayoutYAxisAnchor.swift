//
//  NSLayoutYAxisAnchor.swift
//  Anchora
//
//  Created by Anthony Latsis on 2/8/18.
//  Copyright © 2018 Anthony Latsis. All rights reserved.
//

import UIKit


// MARK: METHODS WITH IMPLICIT RELATION

public extension NSLayoutYAxisAnchor {
    
    @discardableResult public func constraint<T: AnchoraSingleContextRepresentable>(_ object: T) -> NSLayoutConstraint where T.AnchorType == NSLayoutYAxisAnchor {
        
        let constr = object.context().constraints
        
        return self.constraint(constr.relation, to: constr.anchor!, multiplier: constr.multiplier, constant: constr.constant)
    }
    
    public func constrain<T: AnchoraSingleContextRepresentable>(_ object: T) where T.AnchorType == NSLayoutYAxisAnchor {
        
        self.constraint(object).activate()
    }
}

// MARK: CONSTRAINT ACTIVATING METHODS

public extension NSLayoutYAxisAnchor {
    
    public func equals<T: AnchoraSingleContextRepresentable>(_ object: T) where T.AnchorType == NSLayoutYAxisAnchor, T.RelationType == LayoutDefaultRelation {
        
        self.constrain(object)
    }

    public func lessOrEquals<T: AnchoraSingleContextRepresentable>(_ object: T) where T.AnchorType == NSLayoutYAxisAnchor, T.RelationType == LayoutDefaultRelation {
        
        let context = object.context()
        
        context.constraints.relation = .lessThanOrEqual
        
        self.constrain(context)
    }
    
    public func greaterOrEquals<T: AnchoraSingleContextRepresentable>(_ object: T) where T.AnchorType == NSLayoutYAxisAnchor, T.RelationType == LayoutDefaultRelation {
        
        let context = object.context()
        
        context.constraints.relation = .greaterThanOrEqual
        
        self.constrain(context)
    }
}

extension NSLayoutYAxisAnchor: AnchoraSingleContextRepresentable {
    
    public func context() -> AnchoraSingleContext<NSLayoutYAxisAnchor, LayoutDefaultRelation> {
        
        return AnchoraSingleContext.init(constraints: AnchoraConstraintContext.init(anchor: self))
    }
}


